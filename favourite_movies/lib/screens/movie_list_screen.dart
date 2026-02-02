import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';
import 'movie_detail_screen.dart';
import '../data/movies.dart';
import '../common/strings.dart';

class MovieListScreen extends StatefulWidget {
  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  // Use shared sample data from `lib/data/movies.dart`
  final List<Movie> movies = sampleMovies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appTitle)),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieCard(
            movie: movies[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetailScreen(movie: movies[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
