import 'package:flutter/material.dart';

class VendorHeaderWidget extends StatelessWidget {
  const VendorHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101,
      padding: const EdgeInsets.all(16),
      decoration: const ShapeDecoration(
        color: Color(0xFFFBFCFC),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFFEAECF0),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 69,
            height: 69,
            padding: const EdgeInsets.only(
              top: 28,
              left: 11,
              right: 6,
              bottom: 23,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              image: const DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMPQN-VG_1jrfAjhL7I6ga2wHJmiIBKzVAHStUwzpTvA&s')),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFF2F3F6)),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
           
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: SizedBox(
              child: Text(
                'Speco - The spectacle company',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w800,
                  height: 0.09,
                  letterSpacing: 0.39,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}