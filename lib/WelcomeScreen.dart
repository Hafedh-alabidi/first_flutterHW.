 import 'dart:ui';
 import 'package:flutter/material.dart';
 import 'package:flutter/services.dart';

class HafedhWelcomeScreen extends StatefulWidget {
  final String hafedhUserName;

  const HafedhWelcomeScreen({
    super.key,
    required this.hafedhUserName,
  });

  @override
  State<HafedhWelcomeScreen> createState() => _HafedhWelcomeScreenState();
}

class _HafedhWelcomeScreenState extends State<HafedhWelcomeScreen> {
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
              // صورة ترحيبية
              Image.asset(
                'assets/Image/hf.png',  
                width: 380,
                height: 283,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              // رسالة الترحيب
              Text(
                "Hello, ${widget.hafedhUserName}!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: HafedhColors.textColor,
                ),
              ),
              const SizedBox(height: 10),
              // رسالة إضافية
              Text(
                "Welcome to our app. We're glad to have you here!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: HafedhColors.subTextColor,
                ),
              ),
              const SizedBox(height: 30),
              // زر العودة
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
  static const Color primaryColor = Colors.blueAccent; // اللون الرئيسي
  static const Color textColor = Colors.black; // لون النص الأساسي
  static const Color subTextColor = Colors.grey; // لون النص الفرعي
}
