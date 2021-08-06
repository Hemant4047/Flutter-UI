import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This function does all the clipping.

    final Path myPath = Path();

    // going to end of first edge of container.
    myPath.lineTo(0.0, size.height);

    // creating curve patterns on bottom edge of container.
    var endPoint = Offset(size.width * 0.5, size.height * (15 / 16));
    var controlPoint = Offset(size.width * 0.25, size.height * (7 / 8));

    // Creates first curve
    myPath.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    endPoint = Offset(size.width, size.height * (13.0 / 16));
    controlPoint = Offset(size.width * 0.75, size.height);

    // creates second curve
    myPath.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    // myPath.lineTo(size.width, size.height);

    // going to upper point of right edge.
    myPath.lineTo(size.width, 0.0);

    // closing the path, i.e returning to (0, 0)
    myPath.close();

    return myPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
