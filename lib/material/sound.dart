import 'package:flutter/material.dart';

class Sound extends StatefulWidget {
  const Sound({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<Sound> createState() => _SoundState();
}

class _SoundState extends State<Sound> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
