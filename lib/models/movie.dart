// Model used to store all of the information for one movie.
class Movie {
  final String title;
  final String posterPath;
  final List<String> cast;
  final String synopsis;

  // Each Movie object must include all of these values.
  const Movie({
    required this.title,
    required this.posterPath,
    required this.cast,
    required this.synopsis,
  });
}