import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        surface: AppColors.surface,
        onSurface: AppColors.ink,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.ink,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: AppColors.ink,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
        shape: Border(
          bottom: BorderSide(color: AppColors.ink, width: 3),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.ink, width: 3),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
