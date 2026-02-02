import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Column(
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
            child: Text(
              movie.description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
