import 'package:flutter/material.dart';
import 'package:kickstarther/pages/feed.dart';
import 'package:kickstarther/pages/home.dart';
import 'package:kickstarther/pages/login.dart';
import 'package:kickstarther/pages/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        home: const LogInPage(),
        routes: {
          "login": (context) => const LogInPage(),
          "onboarding": (context) => const OnboardingPage(),
          "home": (context) => const HomePage(
                isDemonstration: false,
              ),
          "feed": (context) => const Feed(),
        });
  }
}
