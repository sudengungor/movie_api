import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_api/movie_details.dart';
import 'package:movie_api/movie_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<List<MovieModel>> ghibliFilmleriniGetir() async {
    final url = Uri.parse(
      "https://ghibliapi.vercel.app/films",
    ); //link olduğunu belli ettik uri nesnesine dönüştürdük
    final cevap = await http.get(
      url,
    ); //istek(request) attık cevap(response) bekliyoruz

    if (cevap.statusCode == 200) {
      List<dynamic> hamListe = jsonDecode(cevap.body); //likteki tüm bilgiler

      List<MovieModel> movieModels = hamListe
          .map((movieJson) => MovieModel.fromJson(movieJson))
          .toList();

      return movieModels;
    } else {
      throw Exception("Filmler yüklenirken internet hatası oluştu!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie Ghibli API"), centerTitle: true),
      body: FutureBuilder<List<MovieModel>>(
        future:
            ghibliFilmleriniGetir(), // Hangi internet fonksiyonunu dinleyecek?
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("HATA: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final movies = snapshot.data!;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Card(
                  child: ListTile(
                    leading: ClipRRect(
                      child: Hero(
                        tag: movie.id,
                        child: Image.network(movie.image),
                      ),
                    ),
                    title: Text(movie.title),
                    subtitle: Text(
                      "${movie.originalTitle} | ${movie.originalTitleRomanised}",
                    ),
                    trailing: Text("Score: ${movie.rtScore}"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetails(movie: movie),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("Not Found"));
          }
        },
      ),
    );
  }
}
