import 'package:flutter/material.dart';
import 'dart:math' as math;

class GradientArcPainter extends CustomPainter {
  const GradientArcPainter({
    required this.progress,
    required this.colors,
    required this.width,
  })  : super();

  final double progress;
  final List<Color> colors;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    final gradient = SweepGradient(
      startAngle: 3 * math.pi / 2,
      endAngle: 7 * math.pi / 2,
      tileMode: TileMode.repeated,
      colors: colors,
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.butt  // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (width / 2);
    const startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}