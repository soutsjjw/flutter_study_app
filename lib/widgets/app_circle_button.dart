import 'package:flutter/material.dart';

class AppCircleButton extends StatelessWidget {
  const AppCircleButton({
    Key? key,
    required this.child,
    this.color,
    this.onTap,
    this.width = 60,
  }) : super(key: key);

  final Widget child;
  final Color? color;
  final double width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          // padding: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.only(
            left: 3.0,
            top: 10.0,
            right: 10.0,
            bottom: 10.0,
          ),
          child: child,
        ),
      ),
    );
  }
}
