import 'package:flutter/material.dart';

class KeyboardController extends StatefulWidget {
  const KeyboardController({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<KeyboardController> createState() => _KeyboardControllerState();
}

class _KeyboardControllerState extends State<KeyboardController> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
