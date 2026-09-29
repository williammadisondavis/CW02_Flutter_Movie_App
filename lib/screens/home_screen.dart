import 'package:flutter/material.dart';

import 'details_screen.dart';
import '../data/movies_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Watchlist'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: sampleMovies.length,
        itemBuilder: (context, index) {
          final movie = sampleMovies[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),

              // Temporary movie icon.
              leading: const CircleAvatar(child: Icon(Icons.movie)),

              title: Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text('${movie.cast.length} cast members'),

              trailing: const Icon(Icons.chevron_right),

              // Open the DetailsScreen and pass the selected Movie object.
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(movie: movie),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
