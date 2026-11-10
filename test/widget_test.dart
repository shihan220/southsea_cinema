import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  testWidgets('Basic app loading test', (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());
    expect(find.text(appTitle), findsOneWidget);
    expect(find.byType(MovieCard), findsWidgets);
    expect(find.text('BOOK TICKETS'), findsWidgets);
  });
  testWidgets('User can book tickets for a movie', (tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('BOOK TICKETS').first);
    await tester.pumpAndSettle();

    expect(find.byType(MovieListing), findsOneWidget);
    expect(find.text('The Amazing Spider-Man'), findsOneWidget);

    await tester.ensureVisible(find.byType(DropdownMenu<int>));
    await tester.tap(find.byType(DropdownMenu<int>));
    await tester.pumpAndSettle();

    await tester.tap(find.text('2').last);
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('ADD TO ORDER'));
    await tester.tap(find.text('ADD TO ORDER'));
    await tester.pumpAndSettle();

    expect(
      find.text(
        'Added 2 Adult tickets for The Amazing Spider-Man. Total: £15.00',
      ),
      findsOneWidget,
    );

    expect(find.byType(MovieListing), findsOneWidget);
    expect(find.text('The Amazing Spider-Man'), findsOneWidget);
  });

  testWidgets('Displays screening and selects tickets locally on mobile',
      (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final movies = MovieRepository().getMovies();

    await tester.pumpWidget(
      MaterialApp(
        home: MovieListing(movie: movies[0]),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('The Amazing Spider-Man'), findsOneWidget);
    expect(find.text('Adult (£7.50)'), findsOneWidget);
    expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
        isNull);
    await tester.ensureVisible(find.byType(DropdownMenu<int>));
    await tester.tap(find.byType(DropdownMenu<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('2').last);
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('ADD TO ORDER'));
    await tester.tap(find.text('ADD TO ORDER'));
    await tester.pumpAndSettle();
    expect(
      find.text(
        'Added 2 Adult tickets for The Amazing Spider-Man. Total: £15.00',
      ),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });
}
