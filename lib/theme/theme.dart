
import 'package:flutter/material.dart';

class Themes {



  final lightTheme = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    primaryColor: Colors.grey[200],
    accentColor: Colors.teal[300],
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.teal[300],
      foregroundColor: Colors.black,
    )
  );



  final darkTheme = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    primaryColor: Colors.grey[700],
    accentColor: Colors.grey,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
      )
  );



}