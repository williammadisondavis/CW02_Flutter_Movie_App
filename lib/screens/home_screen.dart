import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Watchlist'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sampleMovies.length,
        itemBuilder: (context, index) {
          final movie = sampleMovies[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(movie: movie),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        movie.posterPath,
                        width: 75,
                        height: 105,
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
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            '${movie.cast.length} cast members',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}