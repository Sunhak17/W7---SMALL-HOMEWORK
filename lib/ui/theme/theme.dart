import 'package:flutter/material.dart';
 
///
/// Definition of App colors.
///
class AppColors {

  // Bellow colors never changes with theme :
  static Color neutralDark = const Color(0xFF054752);
  static Color neutralLight = const Color(0xFF708c91);

  static Color neutral = const Color(0xFF3d5c62);
  static Color neutralLighter = const Color(0xFF92A7AB);

  static Color greyLight = const Color(0xFFE2E2E2);
 

  static Color get text {
    return AppColors.neutralDark;
  }

  static Color get textLight {
    return AppColors.neutralLight;
  }

  static Color get iconNormal {
    return AppColors.neutral;
  }

  static Color get iconLight {
    return AppColors.neutralLighter;
  }

  static Color get disabled {
    return AppColors.greyLight;
  }
}

///
/// Definition of App text styles.
///
class AppTextStyles {
  static TextStyle heading = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w500,
  );

  static TextStyle body = TextStyle(fontSize: 30, fontWeight: FontWeight.w400);

  static TextStyle label = TextStyle(fontSize: 20, fontWeight: FontWeight.w400);
}

///
/// Definition of App Theme.
///
ThemeData appTheme = ThemeData(
  fontFamily: 'Eesti',
  scaffoldBackgroundColor: Colors.white,
);
