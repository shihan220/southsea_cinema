import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      Movie(
        id: 'amazing-spider-man',
        title: 'The Amazing Spider-Man',
        synopsis: 'Peter Parker becomes Spider-Man and battles the Lizard '
            'while uncovering the truth about his parents.',
        ageRating: '12A',
        runtime: '136 minutes',
        screeningTime: 'Thursday 22 Oct 2026, 18:00',
        ticketPrice: 7.50,
        imagePath: 'assets/images/amazing_spider_man.jpeg',
      ),
      Movie(
        id: 'venom-the-last-dance',
        title: 'Venom: The Last Dance',
        synopsis: 'Eddie and Venom go on the run as they are hunted '
            'by enemies from both of their worlds.',
        ageRating: '15',
        runtime: '109 minutes',
        screeningTime: 'Friday 23 Oct 2026, 19:00',
        ticketPrice: 7.50,
        imagePath: 'assets/images/venom_the_last_dance.jpeg',
      ),
    ];
  }
}
