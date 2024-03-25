import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/onboarding-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "On Boarding Screen",
      home: OnboardingScreen(),
    );
  }
}
