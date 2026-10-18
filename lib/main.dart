import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ui/screens/onboarding_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const NexusLingoApp());
}

class NexusLingoApp extends StatelessWidget {
  const NexusLingoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NexusLingo Autonomous',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF070913),
      ),
      home: const OnboardingScreen(),
    );
  }
}
