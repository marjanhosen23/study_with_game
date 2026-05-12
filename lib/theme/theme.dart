import 'package:flutter/material.dart';

class AppColors {
  static const Color mainCard = Color(0xFF8FC7FF);
  static const Color smallCard = Color(0xFF61AFFE);
  static const Color button = Color(0xFF0F3046);

  static const Color background = Color(0xFFEAF5FF);
  static const Color textDark = Color(0xFF102A43);
  static const Color border = Color(0xFFB7DAFF);
  static const Color textColor =Color(0xFF000000);
  static const Color hint_text =Color(0xFFA1A0A0);
  static const Color loginwriting =Color(0xFF3E7BB8);
  static const Color forgetpass = Color(0xFF3E7BB8);
  static const Color create =Color(0xFF1C4F81);
}

ThemeData lightTheme = ThemeData(
  useMaterial3: true,

  scaffoldBackgroundColor: AppColors.background,

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.button,
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.button,
      foregroundColor: Colors.white,
      elevation: 2,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 14,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
  ),

  cardTheme: CardThemeData(
    color: AppColors.smallCard,
    elevation: 4,
    shadowColor: Colors.black12,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),

  ),

  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: "InriaSerif",
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.loginwriting,
    ),

    bodyMedium: TextStyle(
      color: AppColors.textDark,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontFamily: "Inter",
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.forgetpass,
    ),
    labelLarge: TextStyle(
      fontFamily: "Inter",
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.create,
    ),
  ),
);