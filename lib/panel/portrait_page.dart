import 'package:flutter/material.dart';
import 'package:my_tetris/generated/i18n.dart';
import 'package:my_tetris/income/donation_dialog.dart';
import 'package:my_tetris/main.dart';
import 'package:my_tetris/panel/controller.dart';
import 'package:my_tetris/panel/screen.dart';

class PortraitPage extends StatelessWidget {
  const PortraitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenW = size.width * 0.8;
    return SizedBox.expand(
      child: Container(
        // 背景色
        color: backgroundColor,
        child: Padding(
          padding: MediaQuery.of(context).padding,
          child: Column(
            children: [
              // 捐赠按钮
              const _DonationButton(),
              // 分隔
              const Spacer(),
              // 屏幕边缘装饰
              _ScreenDecoration(child: Screen(width: screenW)),
              // 分隔
              const Spacer(flex: 2),
              // 游戏控制按钮
              const GameController(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScreenDecoration extends StatelessWidget {
  const _ScreenDecoration({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFF987f0f),
            width: screenBorderWidth,
          ),
          left: BorderSide(
            color: Color(0xFF987f0f),
            width: screenBorderWidth,
          ),
          right: BorderSide(
            color: Color(0xFFfae36c),
            width: screenBorderWidth,
          ),
          bottom: BorderSide(
            color: Color(0xFFfae36c),
            width: screenBorderWidth,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
        child: Container(
          padding: const EdgeInsets.all(3),
          color: backgroundColor,
          child: child,
        ),
      ),
    );
  }
}

class _DonationButton extends StatelessWidget {
  const _DonationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        OutlinedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const DonationDialog(),
              );
            },
            child: Text(AppLocalizations.of(context)!.reward))
      ],
    );
  }
}
