class Movie {
  final String title;
  final String description;
  final String imageUrl;

  /// Immutable model for a Movie.
  const Movie({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description, 'imageUrl': imageUrl};
  }

  @override
  String toString() => 'Movie(title: $title)';
}
