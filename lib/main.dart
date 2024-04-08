import 'package:flutter/material.dart';
// import 'package:login_signup/screens/welcome_screen.dart';
import 'package:register/screens/signin_screen.dart';
import 'package:register/theme/theme.dart';

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
      title: 'Login screen',
      theme: lightMode,
      home: const SignInScreen(),
    );
  }
}