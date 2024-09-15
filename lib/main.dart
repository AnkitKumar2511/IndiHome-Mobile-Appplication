import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:indihome/Onboarding/onboarding_view.dart'; // Import the onboarding view


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IndiHome',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingView(), // Show onboarding view first
    );
  }
}
