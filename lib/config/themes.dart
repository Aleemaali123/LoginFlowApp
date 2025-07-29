import 'package:flutter/material.dart';
import 'package:machinetest/config/colors.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.primary,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: Colors.white,
      letterSpacing: 1.2,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.card,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.accent1, width: 1.2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.error, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
    labelStyle: TextStyle(color: AppColors.textSecondary, fontSize: 16),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      elevation: 4,
      shadowColor: AppColors.shadow,
    ),
  ),
  cardTheme: CardTheme(
    color: AppColors.card,
    elevation: 8,
    shadowColor: AppColors.shadow,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.primary,
    circularTrackColor: AppColors.accent1,
  ),
  dividerTheme: const DividerThemeData(
    color: Color(0xFFE0E0E0),
    thickness: 1.2,
    space: 32,
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
        color: AppColors.textPrimary),
    bodyLarge: TextStyle(fontSize: 18, color: AppColors.textPrimary),
    bodyMedium: TextStyle(fontSize: 16, color: AppColors.textSecondary),
    labelLarge: TextStyle(
        fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.primary),
  ),
);
