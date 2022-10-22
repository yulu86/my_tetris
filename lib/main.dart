import 'package:flutter/material.dart';
import 'package:my_tetris/gamer/gamer.dart';
import 'package:my_tetris/gamer/keyboard.dart';
import 'package:my_tetris/material/sound.dart';
import 'package:my_tetris/panel/page_land.dart';
import 'package:my_tetris/panel/page_portrait.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tetris',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const Scaffold(
        body: Sound(
          child: Game(
            child: KeyboardController(child: _HomePage()),
          ),
        ),
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool land = MediaQuery.of(context).orientation == Orientation.landscape;
    return land ? const PageLand() : const PagePortrait();
  }
}
