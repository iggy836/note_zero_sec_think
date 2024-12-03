// アプリケーション全体で使用する定数の定義
// 色、テキスト、設定値などを管理 
import 'package:flutter/material.dart';

// アプリケーション全般の設定
class AppConstants {
  // アプリケーション名
  static const String appName = 'One Minute Memo';
  
  // タイマー関連
  static const int timerDuration = 60; // 秒
  static const double timerStrokeWidth = 10.0;
  
  // アニメーション
  static const Duration animationDuration = Duration(milliseconds: 300);
}

// UI関連の定数
class AppColors {
  // テーマカラー
  static const Color primary = Colors.blue;
  static const Color secondary = Colors.blueAccent;
  
  // タイマー関連
  static const Color timerBackground = Colors.grey;
  static const Color timerProgress = Colors.blue;
  static const Color timerText = Colors.black87;
  
  // ボタン
  static const Color buttonStart = Colors.green;
  static const Color buttonNext = Colors.blue;
  
  // カード
  static const Color cardBackground = Colors.white;
  static const Color cardShadow = Colors.black12;
}

// テキストスタイル
class AppTextStyles {
  static const TextStyle questionText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );
  
  static const TextStyle timerText = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    color: AppColors.timerText,
  );
  
  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}

// レイアウト関連
class AppDimensions {
  // マージン・パディング
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  
  // カードの寸法
  static const double cardElevation = 4.0;
  static const double cardBorderRadius = 12.0;
  
  // タイマー
  static const double timerSize = 200.0;
  static const double timerStrokeWidth = AppConstants.timerStrokeWidth;
}

// データベース関連
class DatabaseConstants {
  static const String databaseName = 'one_minute_memo.db';
  static const int databaseVersion = 1;
  
  // テーブル名
  static const String tableQuestions = 'questions';
  static const String tableAnswers = 'answers';
  
  // カラム名
  static const String columnId = 'id';
  static const String columnContent = 'content';
  static const String columnQuestionId = 'question_id';
  static const String columnAnswerText = 'answer_text';
  static const String columnCreatedAt = 'created_at';
}

// 通知関連
class NotificationConstants {
  static const String channelId = 'timer_channel';
  static const String channelName = 'Timer Notifications';
  static const String timeUpTitle = '時間切れ';
  static const String timeUpMessage = '1分が経過しました';
}