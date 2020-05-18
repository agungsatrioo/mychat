import 'package:flutter/material.dart';

class ChatBubble extends CustomPainter {
  final Color color;
  final MainAxisAlignment mainAxisAlignment;

  ChatBubble(
      {@required this.color, this.mainAxisAlignment = MainAxisAlignment.end});

  double radius = 2.0;
  var _x = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    var path = new Path()
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(Offset(size.width, radius), radius: Radius.circular(radius))
      ..lineTo(size.width, size.height - radius)
      ..arcToPoint(Offset(size.width - radius, size.height),
          radius: Radius.circular(radius))
      ..lineTo(_x + radius, size.height)
      ..arcToPoint(Offset(_x, size.height - radius),
          radius: Radius.circular(radius))
      ..lineTo(_x, _x);

    if (mainAxisAlignment == MainAxisAlignment.end) {
      canvas.scale(-1, 1);
      canvas.translate(-size.width, 0);
    }

    canvas.drawPath(
        path,
        Paint()
          ..color = this.color
          ..style = PaintingStyle.fill);
  }

  num degToRad(num deg) => deg * (pi / 180.0);

  num get pi => 3.14159;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
