import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      primary: Colors.black87,
      secondary: Colors.black12,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
