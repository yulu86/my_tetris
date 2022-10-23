import 'package:flutter/material.dart';

const Color screenBackground = Color(0xff9ead86);

class Screen extends StatelessWidget {
  const Screen({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    final playerPanelWidth = width * 0.6;
    return SizedBox(
      width: width,
      height: (playerPanelWidth - 6) * 2 + 6,
      child: Container(
        color: screenBackground,
      ),
    );
  }
}
