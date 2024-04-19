
import 'package:dreampot_voucher_web/utils/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AnimatedCircularChart extends StatelessWidget {
  final double? size;
  final int? total;
  final int? percentageValues;
  final double? fontSize;
  final double? secondFontSize;
  final String? secondText;
  final bool? isSecond;

  const AnimatedCircularChart({
    this.size,
    this.percentageValues,
    this.total = 100,
    this.fontSize = 16,
    this.secondFontSize = 12,
    this.secondText,
    this.isSecond = true,
  });

  @override
  Widget build(BuildContext context) {
    bool isTotalLess = false;
    if (total! < percentageValues!) {
      isTotalLess = true;
    }
    return CircularPercentIndicator(
      radius: size! / 3,
      percent: percentageValues! / (isTotalLess ? percentageValues! : total!),
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
             percentageValues!.toString(),
            
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1,
              fontSize: fontSize,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF777777),
            ),
          ),
          if (isSecond!)
            Text(
               secondText ?? 'left',
           
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1,
                fontSize: secondFontSize,
                fontWeight: FontWeight.w300,
                color: const Color(0xFFABABAB),
              ),
            ),
        ],
      ),
      progressColor: ThemeHelper().primaryFGColor(context),
    );
  }
}