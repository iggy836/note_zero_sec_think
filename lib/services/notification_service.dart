// ローカル通知の管理を行うサービスクラス
// タイマー終了時のアラーム通知を制御
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:audioplayers/audioplayers.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  factory NotificationService() => _instance;

  NotificationService._internal();

  Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(initSettings);
  }

  Future<void> showTimeUpNotification() async {
    try {
      const androidDetails = AndroidNotificationDetails(
        'timer_channel',
        'Timer Notifications',
        importance: Importance.high,
        priority: Priority.high,
      );

      const iosDetails = DarwinNotificationDetails();

      const notificationDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      await _notifications.show(
        0,
        '時間切れ',
        '1分が経過しました',
        notificationDetails,
      );
    } catch (e) {
      print('通知エラー: $e');
    }
  }

  Future<void> playCountdownSound() async {
    if (!_isPlaying) {
      try {
        _isPlaying = true;
        await _audioPlayer.play(AssetSource('sounds/Countdown06-1.mp3'));
        _audioPlayer.onPlayerComplete.listen((_) {
          _isPlaying = false;
        });
      } catch (e) {
        print('音声再生エラー: $e');
        _isPlaying = false;
      }
    }
  }

  Future<void> stopSound() async {
    try {
      await _audioPlayer.stop();
      _isPlaying = false;
    } catch (e) {
      print('音声停止エラー: $e');
    }
  }
}