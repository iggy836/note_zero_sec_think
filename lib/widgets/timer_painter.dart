// カスタムペイントを使用した円形タイマーの描画ウィジェット
// アナログタイマーのUI実装
import 'dart:math';
import 'package:flutter/material.dart';

class TimerPainter extends CustomPainter {
  final double progress; // 0.0 から 1.0 の値（1.0が開始、0.0が終了）
  final Color color;
  final double strokeWidth;

  TimerPainter({
    required this.progress,
    this.color = Colors.blue,
    this.strokeWidth = 8.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - strokeWidth / 2;

    // 背景の円を描画
    final backgroundPaint = Paint()
      ..color = color.withOpacity(0.2)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, backgroundPaint);

    // プログレス円を描画
    final progressPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // 12時の位置から開始
      2 * pi * progress, // 進捗に応じて円弧を描画
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(TimerPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}