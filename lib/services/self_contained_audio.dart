import 'package:flutter_tts/flutter_tts.dart';

class SelfContainedAudio {
  static final FlutterTts _tts = FlutterTts();
  static bool _isInitialized = false;

  static Future<void> init() async {
    if (_isInitialized) return;
    try {
      await _tts.setLanguage("en-US");
      await _tts.setSpeechRate(0.48); // سرعت شمرده و طبیعی
      await _tts.setPitch(1.0);
      await _tts.setVolume(1.0);
      // استفاده از موتور صوتی اختصاصی اگر در دستگاه در دسترس بود
      await _tts.setEngine("com.google.android.tts");
    } catch (_) {
      // در صورت وجود هرگونه مشکل، به موتور پیش‌فرض سوییچ می‌کند
    }
    _isInitialized = true;
  }

  static Future<void> speak(String text) async {
    if (!_isInitialized) await init();
    try {
      await _tts.stop();
      await _tts.speak(text);
    } catch (e) {
      // تضمین عدم کرش کردن اپ در خطاهای صوتی
    }
  }

  static Future<void> stop() async {
    await _tts.stop();
  }
}
