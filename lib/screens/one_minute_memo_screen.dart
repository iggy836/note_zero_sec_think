// タイマー付き質問表示画面
import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/timer_painter.dart';
import '../services/notification_service.dart';
import '../widgets/question_display.dart';
import '../data/initial_questions.dart';
import 'dart:math';

class OneMinuteMemoScreen extends StatefulWidget {
  const OneMinuteMemoScreen({super.key});

  @override
  State<OneMinuteMemoScreen> createState() => _OneMinuteMemoScreenState();
}

class _OneMinuteMemoScreenState extends State<OneMinuteMemoScreen> {
  late Map<String, dynamic> currentQuestion;
  int timeLeft = 60;
  bool isRunning = false;
  double progress = 1.0;
  Timer? timer;
  final NotificationService _notificationService = NotificationService();
  final Random _random = Random();
  final List<int> _usedQuestionIndices = [];

  @override
  void initState() {
    super.initState();
    _getRandomQuestion();
  }

  void _getRandomQuestion() {
    if (_usedQuestionIndices.length >= initialQuestions.length) {
      _usedQuestionIndices.clear();
    }
    
    int randomIndex;
    do {
      randomIndex = _random.nextInt(initialQuestions.length);
    } while (_usedQuestionIndices.contains(randomIndex));
    
    setState(() {
      currentQuestion = initialQuestions[randomIndex];
      _usedQuestionIndices.add(randomIndex);
    });
  }

  void startTimer() {
    setState(() {
      isRunning = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
          progress = timeLeft / 60;
          if (timeLeft == 2) {
            _notificationService.playCountdownSound();
          }
        } else {
          timer.cancel();
        }
      });
    });
  }

  void nextQuestion() {
    setState(() {
      _getRandomQuestion();
      timeLeft = 60;
      progress = 1.0;
      isRunning = false;
    });
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One Minute Memo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuestionDisplay(
                content: currentQuestion['content'],
                subContent: currentQuestion['sub_content'],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 250,
                height: 250,
                child: CustomPaint(
                  painter: TimerPainter(
                    progress: timeLeft / 60,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      formatTime(timeLeft),
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: isRunning ? null : startTimer,
                    child: const Text('Start'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: isRunning ? () {
                      timer?.cancel();
                      setState(() {
                        isRunning = false;
                        timeLeft = 60;
                        progress = 1.0;
                      });
                    } : null,
                    child: const Text('Stop'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: !isRunning ? nextQuestion : null,
                    child: const Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    _notificationService.stopSound();
    super.dispose();
  }
}