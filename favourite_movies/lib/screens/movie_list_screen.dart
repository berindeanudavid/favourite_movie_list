import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';
import 'movie_detail_screen.dart';

class MovieListScreen extends StatefulWidget {
  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final List<Movie> movies = [
    Movie(
      title: 'Inception',
      description: 'A sci-fi movie about dreams inside dreams.',
      imageUrl: 'https://m.media-amazon.com/images/M/MV5BMjExMjkwNTQ0Nl5BMl5BanBnXkFtZTcwNTY0OTk1Mw@@._V1_.jpg',
    ),
    Movie(
      title: 'Interstellar',
      description: 'A journey through space and time.',
      imageUrl: 'https://m.media-amazon.com/images/M/MV5BYzdjMDAxZGItMjI2My00ODA1LTlkNzItOWFjMDU5ZDJlYWY3XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    ),
    Movie(
      title: 'The Matrix',
      description: 'Reality is not what it seems.',
      imageUrl: 'https://m.media-amazon.com/images/M/MV5BN2NmN2VhMTQtMDNiOS00NDlhLTliMjgtODE2ZTY0ODQyNDRhXkEyXkFqcGc@._V1_.jpg',
    ),
    Movie(
      title: 'Sami Pop',
      description: 'You don\'t call me godfather...',
      imageUrl: 'https://m.media-amazon.com/images/M/MV5BNGEwYjgwOGQtYjg5ZS00Njc1LTk2ZGEtM2QwZWQ2NjdhZTE5XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    ),
    Movie(
      title: 'Timi Adam',
      description: 'Mossad. Never Forgive. Never Forget.',
      imageUrl: 'https://m.media-amazon.com/images/M/MV5BNjQzZDc5YzYtYzdkMy00NmQ0LWI0ODctZjFhMzQ4ZDMyMDA5XkEyXkFqcGc@._V1_.jpg',
    ),
    Movie(
      title: 'Schindler\'s List',
      description: 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.',
      imageUrl: 'https://m.media-amazon.com/images/M/MV5BNjM1ZDQxYWUtMzQyZS00MTE1LWJmZGYtNGUyNTdlYjM3ZmVmXkEyXkFqcGc@._V1_.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies')),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieCard(
            movie: movies[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      MovieDetailScreen(movie: movies[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
