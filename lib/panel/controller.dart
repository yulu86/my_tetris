import 'package:flutter/material.dart';
import 'package:my_tetris/panel/controllers/direction_controller.dart';
import 'package:my_tetris/panel/controllers/left_controller.dart';

class GameController extends StatelessWidget {
  const GameController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        children: const [
          Expanded(
            // 左侧控制按钮
            child: LeftController(),
          ),
          Expanded(
            // 方向控制按钮
            child: DirectionController(),
          )
        ],
      ),
    );
  }
}
