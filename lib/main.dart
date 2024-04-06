import 'package:flutter/material.dart';
import 'package:indihome/Onboarding/onboarding_view.dart';
import 'package:indihome/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IndiHome - AR based Interior Designing Application',
      theme: lightMode,
      home: const OnboardingView(),
    );
  }
}
