import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  static const _maxTickets = 5;
  static const _pricePence = 750;
  int _quantity = 0;
  String? _feedback;

  void _addToOrder() {
    if (_quantity < 1 || _quantity > _maxTickets) return;
    setState(() {
      final total = _quantity * _pricePence;
      _feedback = 'Added $_quantity Adult ticket${_quantity == 1 ? '' : 's'} '
          'for The Amazing Spider-Man. Total: £${(total / 100).toStringAsFixed(2)}';
      _quantity = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        color: cinemaBackground,
        child: LayoutBuilder(builder: (context, constraints) {
          final desktop = constraints.maxWidth >= 800;
          final fontSize = desktop ? 24.0 : 18.0;
          return DefaultTextStyle(
            style: TextStyle(
                color: cinemaFontWhite, fontSize: fontSize, height: 1.35),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(desktop ? 26 : 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'THE AMAZING SPIDER-MAN (2012)', //SPIDER MAN TITLE//
                      style: cinemaHeaderStyle.copyWith(
                          fontSize: desktop ? 44 : 30,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Peter Parker becomes Spider-Man and battles the Lizard '
                      'While uncovering the truth aboout his parents.',
                      style: TextStyle(
                        color: cinemaFontMuted,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text('Runtime: 136 minutes'),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text('Age rating: 12A'),
                        ),
                      ],
                    ),
                    SizedBox(height: desktop ? 62 : 36),
                    const Text('Southsea Cinema Room'),
                    const SizedBox(height: 32),
                    const Text('Thursday 22 Oct 2026, 18:00  - ends at 20:16'),
                    SizedBox(height: desktop ? 76 : 44),
                    const Text(
                        'Please note that Discounts / Membership Benefits will be applied once you have selected your tickets'),
                    const SizedBox(height: 32),
                    Text('Select Quantities (Up to $_maxTickets in total)'),
                    SizedBox(height: desktop ? 64 : 40),
                    Text('Tickets',
                        style: TextStyle(
                            fontSize: fontSize + 2,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 22),
                    Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 18,
                        runSpacing: 12,
                        children: [
                          DropdownMenu<int>(
                            width: desktop ? 165 : 110,
                            initialSelection: _quantity,
                            requestFocusOnTap: false,
                            dropdownMenuEntries: List.generate(
                              _maxTickets + 1,
                              (quantity) => DropdownMenuEntry<int>(
                                value: quantity,
                                label: '$quantity',
                              ),
                            ),
                            onSelected: (int? value) {
                              if (value != null) {
                                setState(() {
                                  _quantity = value;
                                  _feedback = null;
                                });
                              }
                            },
                          ),
                          Text(
                              'Adult (£${(_pricePence / 100).toStringAsFixed(2)})'),
                        ]),
                    const SizedBox(height: 48),
                    ElevatedButton(
                      onPressed: _quantity == 0 ? null : _addToOrder,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cinemaBrand,
                        foregroundColor: cinemaFontWhite,
                        disabledBackgroundColor: cinemaSurface,
                        disabledForegroundColor: cinemaFontMuted,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        textStyle: TextStyle(fontSize: fontSize),
                      ),
                      child: const Text('ADD TO ORDER'),
                    ),
                    if (_feedback != null) ...[
                      const SizedBox(height: 20),
                      Semantics(liveRegion: true, child: Text(_feedback!)),
                    ],
                  ]),
            ),
          );
        }),
      ),
    );
  }
}
