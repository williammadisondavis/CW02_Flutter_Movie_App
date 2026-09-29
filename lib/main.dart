import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  // Starts the Flutter app.
  runApp(const MovieApp());
}

// Main app widget that sets up the theme and starting screen.
class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Watchlist',

      // Dark theme used across the whole app.
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF101014),

        // Main color scheme for buttons, highlights, and accents.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),

        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'sans-serif',
        ),

        // Keeps the app bar styling consistent on every screen.
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF101014),
          centerTitle: true,
          elevation: 0,
        ),

        // Default style for the movie cards.
        cardTheme: CardThemeData(
          color: const Color(0xFF1C1C22),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      // HomeScreen is the first screen shown when the app opens.
      home: const HomeScreen(),
    );
  }
}