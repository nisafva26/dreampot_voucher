import 'package:dotted_line/dotted_line.dart';
import 'package:dreampot_voucher_web/common/animated_circular_chart.dart';
import 'package:dreampot_voucher_web/common/rounded_button.dart';
import 'package:dreampot_voucher_web/module/dashboard/succss_screen.dart';
import 'package:dreampot_voucher_web/utils/theme/app_colors.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'dart:math' as math;

import 'package:ticket_widget/ticket_widget.dart';

class Voucher {
  final String? amount;
  final String? companyName;
  final Color? bgColor;
  final Color? fontColor;

  Voucher({
    required this.amount,
    required this.companyName,
    required this.bgColor,
    required this.fontColor,
  });
}

class VoucherComponent extends StatefulWidget {
  const VoucherComponent({super.key});

  @override
  State<VoucherComponent> createState() => _VoucherComponentState();
}

class _VoucherComponentState extends State<VoucherComponent> {
  int _currentIndex = 1;

  //CarouselController carouselController = CarouselController();
  PageController? voucherController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _groupVouchersByPrice();
    voucherController = PageController(viewportFraction: .9, initialPage: 0);
    // startTimer();
  }

  List<Voucher> vouchers = [
    Voucher(
      amount: '₹250',
      companyName: 'Speco - The spectacle company',
      bgColor: const Color(0xffF4EBFF),
      fontColor: const Color(0xff53389E),
    ),
    Voucher(
      amount: '₹600',
      companyName: 'SKU Designs',
      bgColor: const Color(0xffD1E9FF),
      fontColor: const Color(0xff0E7090),
    ),
    Voucher(
      amount: '₹600',
      companyName: 'Myg - The complete digital',
      bgColor: const Color(0xffDCFAE6),
      fontColor: const Color(0xff067647),
    ),
    Voucher(
      amount: '₹800',
      companyName: 'Myg - The complete digital',
      bgColor: const Color(0xffD1E9FF),
      fontColor: const Color(0xff0E7090),
    ),
  ];

  int _selectedIndex = 0;

  void _handleTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> availableVoucherAmounts = ['₹250', '₹600'];

  @override
  void dispose() {
    voucherController!.dispose();
    // _timer!.cancel();
    super.dispose();
  }

  int totalVoucherCategoryCount = 2;

  Map<String, List<Voucher>> _vouchersByPrice = {};

  // to map the vouchers into price categories

  void _groupVouchersByPrice() {
    for (var voucher in vouchers) {
      if (_vouchersByPrice.containsKey(voucher.amount)) {
        _vouchersByPrice[voucher.amount]!.add(voucher);
      } else {
        _vouchersByPrice[voucher.amount!] = [voucher];
      }
    }
  }

  void _onMenuItemTap(String price) {
    int index = vouchers.indexWhere((voucher) => voucher.amount == price);
    if (index != -1) {
      voucherController!.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void _updateSelectedMenuButton(int index) {
    setState(() {
      // Find the price of the voucher at the given index
      String price = vouchers[index].amount!;
      // Update _selectedIndex based on the price
      _selectedIndex = _vouchersByPrice.keys.toList().indexOf(price);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
      'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
      'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
      'https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80',
    ];

    double offset = 0;
    double gauss = 0;
    return SizedBox(
      // height: 600,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Image.asset('assets/voucher_icon.png'),
          const Text(
            'Buy a dreampot Voucher',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.39,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: AppColors.borderColor,
              ),
            ),
            // margin: const EdgeInsets.all(20.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              // children: [
              //   // for (int i = 0; i < availableVoucherAmounts.length; i++)
              //   //   _buildContainer(
              //   //       i, availableVoucherAmounts[i], totalVoucherCategoryCount)

              // ],
              children: _vouchersByPrice.keys
                  .toList()
                  .asMap()
                  .map((index, price) => MapEntry(
                      index,
                      _buildContainer(
                          index, price, _vouchersByPrice.keys.length)))
                  .values
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 395,
            child: PageView.builder(
              itemCount: vouchers.length,
              controller: voucherController,
              onPageChanged: (value) {
                setState(() {
                  _currentIndex = value;
                });
                _updateSelectedMenuButton(value);
                HapticFeedback.lightImpact();
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: voucherController!,
                  builder: (context, child) {
                    if (voucherController!.position.haveDimensions) {
                      offset = voucherController!.page! - index;
                      gauss =
                          math.exp(-(math.pow(offset.abs() - 0.5, 2) / 0.08));
                    }

                    final voucher = vouchers[index % vouchers.length];
                    return Transform.translate(
                      offset: Offset(-20 * gauss * offset.sign, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TicketWidget(
                          width: MediaQuery.of(context).size.width,
                          height: 376,
                          color: voucher.bgColor!,
                          isCornerRounded: true,
                          padding: const EdgeInsets.all(20)
                              .copyWith(right: 0, left: 0),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  //  color: Colors.yellow,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 24),
                                        child: TopRight(
                                          child: Container(
                                            width: 46,
                                            height: 46,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFFFFFFF),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const AnimatedCircularChart(
                                              size: 60.0,
                                              percentageValues: 8,
                                              fontSize: 13,
                                              secondFontSize: 10,
                                              total: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '${voucher.amount!}',
                                              style: TextStyle(
                                                color: voucher.fontColor,
                                                fontSize: 60,
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight.w900,
                                                letterSpacing: 0.39,
                                              ),
                                            ),
                                            Text(
                                              'Voucher',
                                              style: TextStyle(
                                                color: voucher.fontColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.39,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                DottedLine(
                                  dashColor: voucher.fontColor!,
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '1. Get a chance to win sunglasses worth ₹15000',
                                          style: TextStyle(
                                            color: voucher.fontColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.39,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                          height: 40,
                                          child: FlutterImageStack(
                                            imageList: images,
                                            totalCount: 4,
                                            itemRadius:
                                                40, // Radius of each images
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        // const Spacer(),
                                        Text(
                                          '2. Use ₹600 in next purchase with Speco',
                                          style: TextStyle(
                                            color: voucher.fontColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.39,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        RoundedButton(
                                          text: 'Buy voucher',
                                          callback: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PrinterVoucher(voucher: voucher,),
                                                ));
                                          },
                                          textColor: const Color(0xff00AEEF),
                                          backgroundColor: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(vouchers.length, (index) {
              return GestureDetector(
                onTap: () => _onIndicatorTapped(index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 8.0,
                    height: 8.0,
                    //  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? vouchers[index].fontColor
                          : Colors.grey[300],
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  void _onIndicatorTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildContainer(int index, String text, int totalContainers) {
    return GestureDetector(
      onTap: () {
        _handleTap(index);
        _onMenuItemTap(text);
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Colors.grey[300] : Colors.white,
          borderRadius: _calculateBorderRadius(index, totalContainers),
          border: _calculateBorder(index, totalContainers),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF1D2838),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  BorderRadius _calculateBorderRadius(int index, int totalContainers) {
    if (index == 0) {
      return const BorderRadius.only(
        topLeft: Radius.circular(12),
        bottomLeft: Radius.circular(12),
      );
    } else if (index == totalContainers - 1) {
      return const BorderRadius.only(
        topRight: Radius.circular(12),
        bottomRight: Radius.circular(12),
      );
    } else {
      return BorderRadius.zero;
    }
  }

  Border _calculateBorder(int index, int totalContainers) {
    if (totalContainers == 1) {
      return Border.all(color: AppColors.borderColor);
    } else if (index == 0) {
      return Border.all(color: Colors.transparent);
    } else if (index == totalContainers - 1) {
      return const Border(
        left: BorderSide(color: AppColors.borderColor),
        //right: BorderSide(color: AppColors.borderColor),
      );
    } else {
      return const Border(
        left: BorderSide(color: AppColors.borderColor),
      );
    }
  }
}
