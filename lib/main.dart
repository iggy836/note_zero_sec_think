// アプリケーションのエントリーポイント
// MaterialAppの設定とアプリケーションの初期化を行う
import 'package:flutter/material.dart';
import 'screens/one_minute_memo_screen.dart';

void main() {
  runApp(const OneMinuteMemoApp());
}

class OneMinuteMemoApp extends StatelessWidget {
  const OneMinuteMemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Minute Memo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OneMinuteMemoScreen(),
    );
  }
}