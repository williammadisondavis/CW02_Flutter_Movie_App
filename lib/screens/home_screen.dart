import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../data/movies_data.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie Watchlist',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.1,
            shadows: [
              Shadow(
                blurRadius: 8,
                offset: Offset(0, 2),
                color: Colors.deepPurpleAccent,
              ),
            ],
          ),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sampleMovies.length,
        itemBuilder: (context, index) {
          final movie = sampleMovies[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 18),
            elevation: 8,
            shadowColor: Colors.black54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: const BorderSide(
                color: Colors.deepPurpleAccent,
                width: 0.8,
              ),
            ),

            child: InkWell(
              borderRadius: BorderRadius.circular(18),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      movie: movie,
                    ),
                  ),
                );
              },

              child: Padding(
                padding: const EdgeInsets.all(12),

                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        movie.posterPath,
                        width: 85,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.3,
                              shadows: [
                                Shadow(
                                  blurRadius: 4,
                                  offset: Offset(0, 1),
                                  color: Colors.black87,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            '${movie.cast.length} cast members',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),

                          const SizedBox(height: 12),

                          const Row(
                            children: [
                              Icon(
                                Icons.touch_app,
                                size: 17,
                                color: Colors.deepPurpleAccent,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Tap for details',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.chevron_right,
                      color: Colors.deepPurpleAccent,
                    ),
                  ],
                ),
              ),
            ),
          )
              .animate()
              .fadeIn(
                duration: 400.ms,
                delay: (index * 100).ms,
              )
              .slideX(
                begin: 0.1,
                end: 0,
              );
        },
      ),
    );
  }
}