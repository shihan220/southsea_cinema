import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cinemaSurface, //coloring the text of the cards
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title,
              style: cinemaHeaderStyle,
            ),
            const SizedBox(height: 8),
            Text('Age rating: ${movie.ageRating}'),
            const SizedBox(height: 16),
            Image.asset(
              movie.imagePath,
              height: 240,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              movie.synopsis,
              style: const TextStyle(color: cinemaFontMuted),
            ),
            const SizedBox(height: 8),
            Text('Screening: ${movie.screeningTime}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return MovieListing(movie: movie);
                  },
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: cinemaBrand,
                foregroundColor: cinemaFontWhite,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text('BOOK TICKETS'),
            ),
          ],
        ),
      ),
    );
  }
}
