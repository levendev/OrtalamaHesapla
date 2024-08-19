import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Sabitler {
  static const MaterialColor renk = Colors.indigo;
  static const String baslikText = 'Ortalama Hesapla';
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
    color: renk,
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );

  static final TextStyle ortalamaGosterBody = GoogleFonts.quicksand(
    color: renk,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
    color: renk,
    fontSize: 55,
    fontWeight: FontWeight.w600,
  );
  static BorderRadius borderRadius = BorderRadius.all(Radius.circular(18));

  static EdgeInsetsGeometry dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static final yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);

  static final allPadding8 = EdgeInsets.all(8);

  static final TextStyle derslerCircleAvatarTextStyle =
      TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500);
}
