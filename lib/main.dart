import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home.dart';

void main() => runApp(Trevler());

class Trevler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.nunitoTextTheme()),
      home: Home(),
    );
  }
}
