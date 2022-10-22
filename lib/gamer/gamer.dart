import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
