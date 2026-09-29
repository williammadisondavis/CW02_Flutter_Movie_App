import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Watchlist',

      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF101014),

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),

        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'sans-serif',
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF101014),
          centerTitle: true,
          elevation: 0,
        ),

        cardTheme: CardThemeData(
          color: const Color(0xFF1C1C22),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      home: const HomeScreen(),
    );
  }
}