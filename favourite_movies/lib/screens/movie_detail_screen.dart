import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const MovieDetailScreen({
    super.key,
    required this.movie,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? Colors.amber : Colors.white,
            ),
            onPressed: onFavoriteToggle,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            movie.imageUrl.startsWith('assets/')
                ? Image.asset(
                    movie.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    movie.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 200,
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.broken_image,
                        size: 64,
                        color: Colors.grey,
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[300]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
