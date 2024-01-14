// import 'package:flutter/material.dart';
//  class ParabolicClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.moveTo(0, size.height); // Move to the bottom-left corner
//     path.lineTo(size.width, size.height); // Draw a line to the bottom-right corner
//     path.quadraticBezierTo(size.width / 2, size.height * 0.9, 3, 3); // Draw parabolic curve
//     path.close(); // Close the path to form a shape
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false; // Returning false here ensures the clipper won't be recalculated.
//   }
// }