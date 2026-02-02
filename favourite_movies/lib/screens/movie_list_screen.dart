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

  // Favourite tracking (uses title as unique key for simplicity)
  final Set<String> favourites = {};

  void _toggleFavorite(Movie movie) {
    setState(() {
      if (favourites.contains(movie.title)) {
        favourites.remove(movie.title);
      } else {
        favourites.add(movie.title);
      }
    });
  }

  bool showOnlyFavourites = false;

  @override
  Widget build(BuildContext context) {
    final visibleMovies = showOnlyFavourites
        ? movies.where((m) => favourites.contains(m.title)).toList()
        : movies;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
        actions: [
          IconButton(
            tooltip: 'Show favourites only',
            icon: Icon(
              showOnlyFavourites ? Icons.star : Icons.filter_list,
              color: showOnlyFavourites ? Colors.amber : Colors.white,
            ),
            onPressed: () {
              setState(() {
                showOnlyFavourites = !showOnlyFavourites;
              });
            },
          ),
        ],
      ),
      body: visibleMovies.isEmpty
          ? Center(
              child: Text(
                showOnlyFavourites ? 'No favourites yet' : 'No movies',
                style: TextStyle(color: Colors.grey[400]),
              ),
            )
          : ListView.builder(
              itemCount: visibleMovies.length,
              itemBuilder: (context, index) {
                final movie = visibleMovies[index];
                final isFav = favourites.contains(movie.title);
                return MovieCard(
                  movie: movie,
                  isFavorite: isFav,
                  onFavoriteToggle: () => _toggleFavorite(movie),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieDetailScreen(
                          movie: movie,
                          isFavorite: isFav,
                          onFavoriteToggle: () => _toggleFavorite(movie),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
