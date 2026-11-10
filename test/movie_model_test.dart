import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model', () {
    test('constructor stores movie details', () {
      final movie = Movie(
        id: 'test-movie',
        title: 'Test Movie',
        synopsis: 'A short description.',
        ageRating: '12A',
        runtime: '120 minutes',
        screeningTime: 'Friday, 19:00',
        ticketPrice: 7.50,
        imagePath: 'assets/images/test_movie.jpg',
      );

      expect(movie.id, 'test-movie');
      expect(movie.title, 'Test Movie');
      expect(movie.synopsis, 'A short description.');
      expect(movie.ageRating, '12A');
      expect(movie.runtime, '120 minutes');
      expect(movie.screeningTime, 'Friday, 19:00');
      expect(movie.ticketPrice, 7.50);
      expect(movie.imagePath, 'assets/images/test_movie.jpg');
    });
    test('formattedPrice shows two decimal places for whole pounds', () {
      final movie = Movie(
        id: 'whole-pound-movie',
        title: 'Test Movie',
        synopsis: 'A short description.',
        ageRating: '12A',
        runtime: '120 minutes',
        screeningTime: 'Friday, 19:00',
        ticketPrice: 8.0,
        imagePath: 'assets/images/test_movie.jpg',
      );

      expect(movie.formattedPrice, '£8.00');
    });
    test('formattedPrice shows two decimal places for pence', () {
      final movie = Movie(
        id: 'pence-movie',
        title: 'Test Movie',
        synopsis: 'A short description.',
        ageRating: '12A',
        runtime: '120 minutes',
        screeningTime: 'Friday, 19:00',
        ticketPrice: 7.5,
        imagePath: 'assets/images/test_movie.jpg',
      );

      expect(movie.formattedPrice, '£7.50');
    });
  });
}
