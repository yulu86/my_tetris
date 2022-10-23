import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.text,
    required this.child,
    required this.direction,
  }) : super(key: key);

  final String text;
  final Widget child;
  final AxisDirection direction;

  @override
  Widget build(BuildContext context) {
    Widget widget = _getWidgetByDirection();
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      child: widget,
    );
  }

  Widget _getWidgetByDirection() {
    switch (direction) {
      case AxisDirection.right:
        return Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          child,
          const SizedBox(width: 8),
          Text(text),
        ]);
      case AxisDirection.left:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text),
            const SizedBox(width: 8),
            child,
          ],
        );
      case AxisDirection.up:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text),
            const SizedBox(height: 8),
            child,
          ],
        );
      case AxisDirection.down:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
            const SizedBox(height: 8),
            Text(text),
          ],
        );
      default:
        return Container();
    }
  }
}
