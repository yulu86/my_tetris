import 'package:flutter/material.dart';
import 'package:my_tetris/gamer/game.dart';
import 'package:my_tetris/panel/controllers/description.dart';
import 'package:my_tetris/panel/controllers/game_button.dart';

class LeftController extends StatelessWidget {
  const LeftController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SystemButtonGroup(),
        Expanded(
          child: Center(
            child: DropButton(),
          ),
        ),
      ],
    );
  }
}

class SystemButtonGroup extends StatelessWidget {
  const SystemButtonGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DropButton extends StatelessWidget {
  const DropButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Description(
    //   text: 'drop',
    //   child: GameButton(
    //     enableLongPress: false,
    //     size: Size(90, 90),
    //     onTap: () {
    //       Game.of(context).drop();
    //     },
    //     icon: null,
    //   ),
    // );
    return Container();
  }
}
