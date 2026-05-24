import 'package:flutter/material.dart';
import 'package:movie_api/movie_model.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}