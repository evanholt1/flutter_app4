import 'package:flutter/material.dart';

class L10n {
  static final all = const [
    const Locale('en'),
    const Locale('ar'),
  ];

  static String getFLag(String countryCode) {
    switch (countryCode) {
      case 'ar':
        return '🇦🇪';
      case 'en':
      default:
        return '🇺🇸';
    }
  }
}
