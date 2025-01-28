import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Define the color palette
  static const Color light = Color(0xFFFFFFFF);
  static const Color normal = Color(0xFF0066FF);
  static const Color dark = Color(0xFF003D99);
  static const Color darker = Color(0xFF002459);

  // Define the text styles using GoogleFonts
  static final TextStyle navbarTitle = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: darker,
  );

  static final TextStyle cardTitle = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: dark,
  );

  static final TextStyle cardSubtitle = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: normal,
  );

  static final TextStyle searchHint = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Color(0xFFC2C2C2),
  );

  static final TextStyle searchButton = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: light,
  );

  static final TextStyle regularText = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.black,
  );

  static final TextStyle sectionHeading = GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    fontSize: 32,
    color: darker,
  );

  static final TextStyle normalHeading = GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    fontSize: 32,
    color: normal,
  );

  // Define the light theme
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: light,
    primaryColor: normal,
    textTheme: TextTheme(
      displayLarge: sectionHeading,
      displayMedium: regularText,
      titleLarge: normalHeading,// Section headings
      titleMedium: navbarTitle, // Navbar titles and card titles
      titleSmall: cardTitle, // Card subtitles
      bodyLarge: searchHint, // SearchBox hint text
      labelLarge: searchButton, // Button text
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: searchHint, // Style for input hints
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: normal, // Button background color
        textStyle: searchButton, // Button text style
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
