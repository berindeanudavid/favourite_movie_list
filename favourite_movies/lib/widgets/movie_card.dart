import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onTap,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.all(10),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: movie.imageUrl.startsWith('assets/')
                    ? Image.asset(
                        movie.imageUrl,
                        width: 80,
                        height: 120,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        movie.imageUrl,
                        width: 80,
                        height: 120,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 80,
                          height: 120,
                          color: Colors.grey[200],
                          child: const Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                          ),
                        ),
                      ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      movie.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[300]),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  color: isFavorite ? Colors.amber : Colors.grey,
                ),
                onPressed: onFavoriteToggle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
