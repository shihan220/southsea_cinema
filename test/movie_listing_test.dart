import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

void main() {
  testWidgets('Displays screening and selects tickets locally on mobile',
      (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(home: MovieListing()));
    await tester.pumpAndSettle();
    expect(find.text('DRACULA (1931) (PG)'), findsOneWidget);
    expect(find.text('Adult (£7.50)'), findsOneWidget);
    expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
        isNull);
    await tester.ensureVisible(find.byType(DropdownButton<int>));
    await tester.tap(find.byType(DropdownButton<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('2').last);
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('ADD TO ORDER'));
    await tester.tap(find.text('ADD TO ORDER'));
    await tester.pumpAndSettle();
    expect(find.text('Added 2 Adult tickets to your order. Total: £15.00'),
        findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
