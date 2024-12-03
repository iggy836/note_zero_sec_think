import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionDisplay extends StatelessWidget {
  final String content;
  final String subContent;

  const QuestionDisplay({
    super.key,
    required this.content,
    required this.subContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            content,
            style: GoogleFonts.notoSans(
              fontSize: 20,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            subContent,
            style: GoogleFonts.mPlusRounded1c(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
} 