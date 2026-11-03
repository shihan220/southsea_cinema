import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository', () {
    test('getMovies returns our two films', () {
      final repository = MovieRepository();

      final movies = repository.getMovies();

      expect(movies.length, 2);
      expect(movies[0].id, 'amazing-spider-man');
      expect(movies[0].title, 'The Amazing Spider-Man');
      expect(movies[1].id, 'venom-the-last-dance');
      expect(movies[1].title, 'Venom: The Last Dance');
    });
    test('getMovieById finds an existing movie', () {
      final repository = MovieRepository();

      final movie = repository.getMovieById('amazing-spider-man');

      expect(movie, isNotNull);
      expect(movie?.id, 'amazing-spider-man');
      expect(movie?.title, 'The Amazing Spider-Man');
    });
    test('getMovieById returns null for a missing ID', () {
      final repository = MovieRepository();

      final movie = repository.getMovieById('missing-movie');

      expect(movie, isNull);
    });
  });
}
