import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 20, 20, 20),
    primary: const Color.fromARGB(255, 112, 112, 112),
    secondary: const Color.fromARGB(255, 30, 30, 30),
    tertiary: const Color.fromARGB(255, 47, 47,
        47), // Tertiary is not part of ColorScheme, but can be used as part of ThemeExtension
    inversePrimary: Colors.grey.shade700,
  ),
);
