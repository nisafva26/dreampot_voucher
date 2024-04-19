
import 'package:dreampot_voucher_web/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeHelper {
  Color? textColor(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode ? Colors.white : Colors.black;
  }

  Color? colorWhite(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode ? Colors.white : Colors.white;
  }

  Color? primaryColor(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode ? AppColors.lightBlue : AppColors.lightBlue;
  }

  Color? primaryFGColor(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode ? AppColors.primaryFG : AppColors.primaryFG;
  }

  List<BoxShadow> getShadowList(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode
        ? [
            const BoxShadow(
              color: Color(0x0f000000),
              blurRadius: 5.0,
              spreadRadius: 3.0,
            ),
          ]
        : [
            const BoxShadow(
              color: Color(0x0f000000),
              blurRadius: 5.0,
              spreadRadius: 3.0,
            ),
          ];
  }
}
