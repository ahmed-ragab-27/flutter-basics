import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

abstract final class AppStyles {
  /// calculator
  static const TextStyle white48Medium = TextStyle(
    fontSize: 48,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle white24Normal = TextStyle(
    fontSize: 24,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );
  static const blue32Medium = TextStyle(
    fontSize: 32,
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w500,
  );

  /// Tic Tac Toe
  static const TextStyle white36Bold = TextStyle(
    fontSize: 36,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle black32SemiBold = TextStyle(
    fontSize: 32,
    color: AppColors.blackX,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle white40Bold = TextStyle(
    fontSize: 40,
    color: AppColors.white,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle white24Medium = TextStyle(
    fontSize: 24,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );
}
