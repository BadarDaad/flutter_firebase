import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/ui/auth/login_screen.dart';

class SplashServices {
  void startTimer(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }
}
