import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final setLightTheme = _buildLightTheme();
final setDarkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  return ThemeData(
    primarySwatch: Colors.grey,
    primaryColor:const Color(0xFFF2F4F9),
    brightness: Brightness.light,
    backgroundColor: const Color(0xFF715940),
    accentColor: const Color(0xffffc600),
    accentIconTheme: const IconThemeData(color: Color(0xffffc600)),
    dividerColor: Colors.white54,


  );
}

ThemeData _buildDarkTheme() {
  return ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: const IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );
}
