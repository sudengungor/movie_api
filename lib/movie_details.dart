import 'package:flutter/material.dart';
import 'package:movie_api/movie_model.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //child1
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.network(
                  movie.movieBanner,
                  width: double.infinity,
                  height: 240,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Container(
                        alignment: Alignment.topCenter,
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),

                 //child3
            Positioned(
              top: 250,
              left: 10,
              right: 10,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Details"),
                    SizedBox(height: 25),
                    Text(movie.description),
                    SizedBox(height: 10),
                    Text("Director: ${movie.director}"),
                  ],
                ),
              ),
            ),

                //child2
                Positioned(
                  top: 160,
                  left: 10,
                  child: Hero(
                    tag: movie.id,
                    child: Container(
                      height: 140,
                      width: 95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 8,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(movie.image, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
           
          ],
        ),
      ),
    );
  }

 
}
