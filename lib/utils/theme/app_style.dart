
import 'package:dreampot_voucher_web/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeText {
  TextStyle walletText = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  TextStyle whiteButtonColor = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  TextStyle heading = const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  TextStyle headingBlack = const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  TextStyle normalText = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );

  TextStyle normalBigText = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );

  TextStyle normalTextBlue = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.lightBlue,
  );

  TextStyle mediumText = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );

  TextStyle normalTextGrey = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
  );

  TextStyle normalTextGreyStrikeThrough = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.lineThrough,
    color: AppColors.grey,
  );

  TextStyle smallerTextGrey = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
  );

  TextStyle normalTextHeavy = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  TextStyle normalTextMedium = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  TextStyle inputTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  TextStyle buttonTextStyle = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  TextStyle bigTextStyle = const TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
}

class ThemeDecoration {
  InputDecoration getInputDecoration(String? label) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: AppColors.lightBlue),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: AppColors.grey),
      ),
      contentPadding:
          const EdgeInsets.only(left: 32.0, top: 20, bottom: 20, right: 16),
      labelText: label,
      errorMaxLines: 3,
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.black,
      ),
    );
  }
}
