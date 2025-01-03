import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HafedhWelcomeScreen extends StatefulWidget {
  final String hafedhUserName;
  final String hafedhEmail;
  final String hafedhPassword;

  const HafedhWelcomeScreen({
    super.key,
    required this.hafedhUserName,
    required this.hafedhEmail,
    required this.hafedhPassword,
  });

  @override
  State<HafedhWelcomeScreen> createState() => _HafedhWelcomeScreenState();
}

class _HafedhWelcomeScreenState extends State<HafedhWelcomeScreen> {
  String _encryptPassword(String password) {
    return '*' * password.length; // إظهار كلمة المرور كمجموعة من النجوم
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Screen"),
        centerTitle: true,
        backgroundColor: HafedhColors.primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Image/hf.png',
                width: 380,
                height: 283,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                "Hello, ${widget.hafedhUserName}!",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: HafedhColors.textColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Your Email: ${widget.hafedhEmail}",
                style: const TextStyle(
                  fontSize: 16,
                  color: HafedhColors.subTextColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Your Password: ${_encryptPassword(widget.hafedhPassword)}",
                style: const TextStyle(
                  fontSize: 16,
                  color: HafedhColors.subTextColor,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  backgroundColor: HafedhColors.primaryColor,
                ),
                child: const Text(
                  "Go Back",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HafedhColors {
  static const Color primaryColor = Colors.blueAccent;
  static const Color textColor = Colors.black;
  static const Color subTextColor = Colors.grey;
}
