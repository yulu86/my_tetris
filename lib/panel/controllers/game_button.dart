import 'dart:async';

import 'package:flutter/material.dart';

class GameButton extends StatefulWidget {
  const GameButton({
    Key? key,
    required this.size,
    required this.icon,
    required this.onTap,
    required this.color,
    required this.enableLongPress,
  }) : super(key: key);

  final Size size;
  final Widget icon;

  final VoidCallback onTap;

  /// the color of button
  final Color color;

  final bool enableLongPress;

  @override
  State<GameButton> createState() => _GameButtonState();
}

class _GameButtonState extends State<GameButton> {
  Timer? _timer;
  bool _tapEnded = false;
  Color _color = Colors.blue;

  @override
  void initState() {
    super.initState();
    _color = widget.color;
  }

  @override
  void didUpdateWidget(covariant GameButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _color,
      elevation: 2,
      shape: const CircleBorder(),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) async {
          setState(() {
            _color = widget.color.withOpacity(0.5);
          });
          if (_timer != null) {
            return;
          }
          _tapEnded = false;
          widget.onTap();
          if (!widget.enableLongPress) {
            return;
          }
          await Future.delayed(const Duration(milliseconds: 300));
          if (_tapEnded) {
            return;
          }
          _timer = Timer.periodic(const Duration(milliseconds: 60), (t) {
            if (!_tapEnded) {
              widget.onTap();
            } else {
              t.cancel();
              _timer = null;
            }
          });
        },
        onTapCancel: () {
          _tapEnded = true;
          _timer?.cancel();
          _timer = null;
          setState(() {
            _color = widget.color;
          });
        },
        onTapUp: (_) {
          _tapEnded = true;
          _timer?.cancel();
          _timer = null;
          setState(() {
            _color = widget.color;
          });
        },
        child: SizedBox.fromSize(
          size: widget.size,
        ),
      ),
    );
  }
}
