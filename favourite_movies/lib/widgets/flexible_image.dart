import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlexibleImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;

  const FlexibleImage(
    this.path, {
    Key? key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  Future<bool> _assetExists(String assetPath) async {
    try {
      await rootBundle.load(assetPath);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (path.startsWith('assets/')) {
      return FutureBuilder<bool>(
        future: _assetExists(path),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return Image.asset(
              path,
              width: width,
              height: height,
              fit: fit,
            );
          }

          // asset not found or still loading: show placeholder box
          return Container(
            width: width,
            height: height,
            color: Colors.grey[900],
            child: const Icon(Icons.broken_image, color: Colors.grey, size: 36),
          );
        },
      );
    }

    // network image with error fallback
    return Image.network(
      path,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => Container(
        width: width,
        height: height,
        color: Colors.grey[900],
        child: const Icon(Icons.broken_image, color: Colors.grey, size: 36),
      ),
    );
  }
}
