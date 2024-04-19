import 'package:dreampot_voucher_web/module/dashboard/components/vendor_header.dart';
import 'package:dreampot_voucher_web/module/dashboard/components/voucher_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset('assets/dreampot_logo.svg'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          VendorHeaderWidget(),
          SizedBox(height: 16,),
          VoucherComponent(),
        ],
      )),
    );
  }
}


