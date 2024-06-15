import 'package:flutter/material.dart';

class CardShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const borderRadius = 16.0;
    const stepHeight = 20.0;

    path.lineTo(0.0, size.height - borderRadius);

//bottom left corner
    path.quadraticBezierTo(0.0, size.height, borderRadius, size.height);

    path.lineTo(size.width - borderRadius, size.height);
//bottom right corner
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - borderRadius);

    path.lineTo(size.width, stepHeight + borderRadius);
//top right corner
    path.quadraticBezierTo(
        size.width, stepHeight, size.width - borderRadius, stepHeight);

//step
    path.lineTo(size.width * 0.7, stepHeight);
    path.lineTo(size.width * 0.55, 0.0);
    path.lineTo(borderRadius, 0.0);
//top left corner
    path.quadraticBezierTo(0.0, 0.0, 0.0, borderRadius);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
