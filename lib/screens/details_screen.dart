import 'package:flutter/material.dart';

import '../models/movie.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  movie.posterPath,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              movie.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Cast',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ...movie.cast.map(
              (actor) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        actor,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Synopsis',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              movie.synopsis,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}