import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trevler/widgets/trips_carousel.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 8),
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Trevler',
                    style: GoogleFonts.staatliches(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.yellow[800],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: Text(
                    'Where are you going?',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                TripsCarousel(),
              ],
            ),
          ),
        ),
      );
}
