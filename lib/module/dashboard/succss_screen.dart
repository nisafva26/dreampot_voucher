import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dreampot_voucher_web/module/dashboard/components/voucher_dashboard.dart';
import 'package:dreampot_voucher_web/utils/theme/app_colors.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class PrinterVoucher extends StatefulWidget {
  final Voucher? voucher;

  const PrinterVoucher({super.key, this.voucher});

  @override
  _PrinterVoucherState createState() => _PrinterVoucherState();
}

class _PrinterVoucherState extends State<PrinterVoucher>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late AnimationController _textController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  AudioPlayer audioPlayer = AudioPlayer();

  int activeStep = 2;
  int currentStep = 0;

  @override
  void initState() {
    super.initState();
    _play();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(
      begin: -220, // Start above the visible area
      end: -10,
    ).animate(_controller);

    //text animation
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Adjust duration as needed
      reverseDuration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeIn,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut)));

    // Delay animation start
    Future.delayed(const Duration(milliseconds: 500), () {
      _controller.forward();
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      _textController.forward();
    });
  }

  // Future<void> playAudio() async {
  //   // audioPlayer.play(AssetSource('assets/printer_audio_wav.wav'));
  //   audioPlayer.play(UrlSource('https://www2.cs.uic.edu/~i101/SoundFiles/BabyElephantWalk60.wav'));
  // }

  AudioPlayer? _player;

  void _play() {
    _player?.dispose();
    final player = _player = AudioPlayer();
    player.play(AssetSource('printer_audio_wav.wav'));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _printVoucher() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: SvgPicture.asset('assets/dreampot_logo.svg'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // height: MediaQuery.of(context).size.height / 1.9,
              height: 430,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xfff0f9ff),
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // Printer image

                    Container(
                      child: Positioned(
                        child: SvgPicture.asset(
                          'assets/printer.svg', // Replace with your printer image path
                          // width: MediaQuery.of(context).size.width,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Voucher container
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return Positioned(
                                top: 0 +
                                    _animation.value, // Animated top position
                                // left: MediaQuery.of(context).size.width / 3.15,
                                child: Container(
                                  width: 183,
                                  height: 284,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/voucher_bg.png')),
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xff47ccff)),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 22,
                                        ),
                                        Container(
                                          width: 47,
                                          height: 47,
                                          padding: const EdgeInsets.only(
                                            top: 28,
                                            left: 11,
                                            right: 6,
                                            bottom: 23,
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            image: const DecorationImage(
                                                image: NetworkImage(
                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMPQN-VG_1jrfAjhL7I6ga2wHJmiIBKzVAHStUwzpTvA&s')),
                                            shape: RoundedRectangleBorder(
                                              // side: const BorderSide(
                                              //     width: 1,
                                              //     color: Color(0xFFF2F3F6)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const SizedBox(
                                          child: Text(
                                            'Speco - The spectacle company',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'Avenir',
                                              fontWeight: FontWeight.w800,
                                              letterSpacing: 0.39,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 27,
                                        ),
                                         Text(
                                          widget.voucher!.amount!,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontFamily: 'Avenir',
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 0.39,
                                          ),
                                        ),
                                        const Text(
                                          'Voucher',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Avenir',
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 0.39,
                                          ),
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset(
                                            'assets/dreampot_logo_white.svg',
                                            height: 23,
                                            width: 97),
                                        const SizedBox(
                                          height: 14,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 26),
                            child: Text(
                              'Congratulations. You just entered\nthe draw.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.39,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Lottie.asset(
                      'assets/confetti.json',
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height/2,
                      fit: BoxFit.fill,
                      repeat: true,
                    ),
                  ],
                ),
              ),
            ),
            const StepperInstructionsWidget(),
          ],
        ),
      ),
    );
  }
}

class StepperInstructionsWidget extends StatelessWidget {
  const StepperInstructionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 33),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'What happens next?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w800,
              letterSpacing: 0.39,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          StepWidget(
            stepNumber: 1,
            isActive: true,
            title: 'Enter the draw',
            description: const Text(
              'You have entered the draw',
              style: TextStyle(
                color: Color(0xFF475466),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            icon: 'assets/users.svg',
            isLast: false,
          ),
          StepWidget(
            stepNumber: 2,
            isActive: true,
            title: 'Download the dreampot app',
            description: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'You will be able to track your draw. Use the same mobile number you used to get the status.',
                  style: TextStyle(
                    color: Color(0xFF475466),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                        // width: 135,
                        height: 40,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFA6A6A6)),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: SvgPicture.asset('assets/playstore.svg',
                            fit: BoxFit.fill),
                      ),
                    ),
                    // Spacer(),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Container(
                        // width: 135,
                        height: 40,
                        decoration: ShapeDecoration(
                          //  color: Colors.black,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFA6A6A6)),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: SvgPicture.asset(
                          'assets/appstore.svg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            icon: 'assets/download_icon.svg',
            isLast: false,
          ),
          StepWidget(
            stepNumber: 3,
            isActive: false,
            title: 'Winner announcement',
            description: const Text(
              'Once the draw is full, a winner will be announced. If you win you will get a product worth Rs 15,000. Check your draw tab to view the winner in the app.',
              style: TextStyle(
                color: Color(0xFF475466),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            icon: 'assets/trophy.svg',
            isLast: false,
          ),
          StepWidget(
            stepNumber: 4,
            isActive: false,
            title: 'Use the voucher',
            description: const Text(
              'You can use the voucher in your next purchase',
              style: TextStyle(
                color: Color(0xFF475466),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            icon: 'assets/stars.svg',
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class StepWidget extends StatelessWidget {
  final int stepNumber;
  final bool isActive;
  final String title;
  final Widget description;
  final String icon;
  final bool isLast;

  StepWidget({
    required this.stepNumber,
    required this.isActive,
    required this.title,
    required this.description,
    required this.icon,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xFFEAECF0), width: 1)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    icon,
                    height: 20,
                    width: 17,
                  ),
                )),
            if (!isLast)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: stepNumber == 1
                    ? 30
                    : stepNumber == 2
                        ? 130
                        : 90,
                width: 2,
                color: Colors.grey[200],
              ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF344053),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                description
              ],
            ),
          ),
        ),
        if (isActive)
          const Padding(
            padding: EdgeInsets.only(top: 7),
            child: Icon(
              Icons.check,
              color: AppColors.lightBlue,
            ),
          )
      ],
    );
  }
}
