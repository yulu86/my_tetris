import 'package:flutter/material.dart';

class LandscapePage extends StatelessWidget {
  const LandscapePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    height -= MediaQuery.of(context).viewInsets.vertical;

    return SizedBox.expand(
      child: Container(),
    );
  }
}
