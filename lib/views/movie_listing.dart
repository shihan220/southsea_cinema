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
      _feedback =
          'Added $_quantity Adult ticket${_quantity == 1 ? '' : 's'} to your order. Total: £${(total / 100).toStringAsFixed(2)}';
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
      body: LayoutBuilder(builder: (context, constraints) {
        final desktop = constraints.maxWidth >= 800;
        final fontSize = desktop ? 24.0 : 18.0;
        return DefaultTextStyle(
          style: TextStyle(
              color: cinemaFontWhite, fontSize: fontSize, height: 1.35),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(desktop ? 26 : 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('DRACULA (1931) (PG)',
                  style: TextStyle(
                      fontSize: desktop ? 44 : 30,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: desktop ? 62 : 36),
              const Text('Southsea Cinema Room'),
              const SizedBox(height: 32),
              const Text('Thursday 22 Oct 2026, 18:00  - ends at 19:14'),
              SizedBox(height: desktop ? 76 : 44),
              const Text(
                  'Please note that Discounts / Membership Benefits will be applied once you have selected your tickets'),
              const SizedBox(height: 32),
              Text('Select Quantities (Up to $_maxTickets in total)'),
              SizedBox(height: desktop ? 64 : 40),
              Text('Tickets',
                  style: TextStyle(
                      fontSize: fontSize + 2, fontWeight: FontWeight.bold)),
              const SizedBox(height: 22),
              Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 18,
                  runSpacing: 12,
                  children: [
                    Container(
                      width: desktop ? 165 : 110,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 4),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF0F0F0),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                        value: _quantity,
                        isExpanded: true,
                        dropdownColor: const Color(0xFFF0F0F0),
                        iconEnabledColor: Colors.black87,
                        style:
                            TextStyle(color: Colors.black, fontSize: fontSize),
                        items: List.generate(
                            _maxTickets + 1,
                            (quantity) => DropdownMenuItem(
                                value: quantity, child: Text('$quantity'))),
                        onChanged: (value) => setState(() {
                          _quantity = value!;
                          _feedback = null;
                        }),
                      )),
                    ),
                    Text('Adult (£${(_pricePence / 100).toStringAsFixed(2)})'),
                  ]),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: _quantity == 0 ? null : _addToOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: cinemaBrand,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: cinemaBrand,
                  disabledForegroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(),
                  elevation: 0,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
    );
  }
}
