import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
                borderRadius: BorderRadius.circular(18),

                child: Image.asset(
                  movie.posterPath,
                  height: 380,
                  fit: BoxFit.cover,
                ),
              ),
            )
                .animate()
                .fadeIn(
                  duration: 500.ms,
                )
                .scale(
                  begin: const Offset(0.95, 0.95),
                ),

            const SizedBox(height: 24),

            Text(
              movie.title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
                .animate()
                .fadeIn(
                  delay: 150.ms,
                ),

            const SizedBox(height: 24),

            const Text(
              'CAST',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 12),

            ...movie.cast.map(
              (actor) => Padding(
                padding: const EdgeInsets.only(bottom: 8),

                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.deepPurple,
                      child: Icon(
                        Icons.person,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Text(
                      actor,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 26),

            const Text(
              'SYNOPSIS',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: const Color(0xFF1C1C22),
                borderRadius: BorderRadius.circular(16),
              ),

              child: Text(
                movie.synopsis,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}