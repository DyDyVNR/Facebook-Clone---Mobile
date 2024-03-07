import 'package:flutter/material.dart';

class RightConcaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(size.width, 0)
      ..cubicTo(size.width - 20, 25, size.width - 20, 30, size.width - 30, 30)
      ..cubicTo(size.width - 62, 30, size.width - 62, 70, size.width - 30, 70)
      ..cubicTo(size.width - 20, 70, size.width, 90, size.width, 90)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}