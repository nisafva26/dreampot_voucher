import 'package:dreampot_voucher_web/module/dashboard/dashboard_screen.dart';
import 'package:dreampot_voucher_web/module/dashboard/components/voucher_dashboard.dart';
import 'package:dreampot_voucher_web/module/dashboard/succss_screen.dart';
import 'package:dreampot_voucher_web/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      theme: ThemeData(
        fontFamily: 'Avenir',
          brightness: Brightness.light,
          primaryColor: AppColors.lightBlue,
       
         colorScheme: const ColorScheme(
            
            surfaceTint: Colors.white,
            primary: AppColors.lightBlue,
            secondary: Colors.blue,
            surface: Colors.white,
            background: Colors.black12,
            error: Colors.red,
            onPrimary: Colors.black,
            onSecondary: Colors.white,
            onSurface: Colors.black,
            onBackground: Colors.black,
            onError: Colors.red,
            brightness: Brightness.light,
          ).copyWith(background: Colors.white),
        
        useMaterial3: true,
        
      ),
      home:  DashboardScreen()
    );
  }
}


