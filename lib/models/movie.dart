// Film details used by the cards and listing.
class Movie {
  final String id;
  final String title;
  final String synopsis;
  final String ageRating;
  final String runtime;
  final String screeningTime;
  final double ticketPrice;
  final String imagePath;

  Movie({
    required this.id,
    required this.title,
    required this.synopsis,
    required this.ageRating,
    required this.runtime,
    required this.screeningTime,
    required this.ticketPrice,
    required this.imagePath,
  });

  // Format the price as £7.50.
  String get formattedPrice {
    return '£${ticketPrice.toStringAsFixed(2)}';
  }
}
