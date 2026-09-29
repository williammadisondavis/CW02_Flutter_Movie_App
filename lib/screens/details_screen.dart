import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../models/movie.dart';

// Screen that shows the full information for one selected movie.
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
        title: Text(
          movie.title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            shadows: [
              Shadow(
                blurRadius: 6,
                offset: Offset(0, 2),
                color: Colors.deepPurpleAccent,
              ),
            ],
          ),
        ),
      ),

      // Lets the page scroll if all of the movie information
      // does not fit on a smaller screen.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Large version of the selected movie's poster.
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
                // Adds a short animation when the details page opens.
                .animate()
                .fadeIn(
                  duration: 500.ms,
                )
                .scale(
                  begin: const Offset(0.95, 0.95),
                ),

            const SizedBox(height: 24),

            // Movie title passed in from HomeScreen.
            Text(
              movie.title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
                shadows: [
                  Shadow(
                    blurRadius: 6,
                    offset: Offset(0, 2),
                    color: Colors.black87,
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 150.ms),

            const SizedBox(height: 26),

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

            // Creates one row for each actor in the movie's cast list.
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

                    Expanded(
                      child: Text(
                        actor,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
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

            // Displays the movie synopsis in its own section.
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C22),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.deepPurple.withValues(alpha: 0.5),
                ),
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