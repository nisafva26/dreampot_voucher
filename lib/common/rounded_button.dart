import 'package:dreampot_voucher_web/utils/theme/app_colors.dart';
import 'package:dreampot_voucher_web/utils/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final bool? upperCase;
  final bool isLoading;
  final bool? isFilled;
  final bool isDisable;
  final IconData? icon;
  final VoidCallback? callback;

  const RoundedButton({
    this.text,
    this.backgroundColor = AppColors.lightBlue,
    this.textColor,
    this.icon,
    this.fontSize = 14,
    this.upperCase,
    this.isDisable = false,
    this.callback,
    this.isLoading = false,
    this.isFilled = true,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(18),
      onPressed: () {
        
          callback!();
        
      },
      disabledColor: Colors.grey,
      color: isDisable ? Colors.grey : backgroundColor,
      highlightColor: backgroundColor,
      elevation: 0,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        //side: BorderSide(color: textColor ?? backgroundColor!),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                  color: textColor ?? ThemeHelper().colorWhite(context),
                ),
              ),
              // Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
