// 質問表示用のカードウィジェット
// 質問テキストとレイアウトの実装
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../models/question.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final bool isActive;

  const QuestionCard({
    super.key,
    required this.question,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimensions.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimensions.cardBorderRadius,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.paddingLarge),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(
            AppDimensions.cardBorderRadius,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 質問番号
            Text(
              '質問 ${question.id}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: AppDimensions.paddingMedium),
            
            // 質問内容
            Text(
              question.content,
              style: AppTextStyles.questionText,
              textAlign: TextAlign.center,
            ),
            
            // アクティブでない場合は半透明のオーバーレイを表示
            if (!isActive)
              Container(
                color: Colors.white.withOpacity(0.7),
                child: const Center(
                  child: Text(
                    '時間切れ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}