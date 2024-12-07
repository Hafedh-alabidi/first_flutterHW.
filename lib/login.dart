// ignore: unused_import
import 'dart:async';
import 'package:flutter/material.dart';
import 'WelcomeScreen.dart'; // تأكد من وجود الملف والكلاس بشكل صحيح

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController hafedhNameController = TextEditingController();
  final TextEditingController hafedhPasswordController = TextEditingController();

  String hafedhErrorMessage = "";
  Color hafedhMessageColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: hafedhColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: hafedhNameController,
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: hafedhPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (hafedhNameController.text == "hafedh" &&
                    hafedhPasswordController.text == "123") {
                  setState(() {
                    hafedhErrorMessage = "Login successful!";
                    hafedhMessageColor = hafedhColors.successColor;
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HafedhWelcomeScreen(
                        hafedhUserName: hafedhNameController.text,
                      ),
                    ));
                  });
                } else {
                  setState(() {
                    hafedhMessageColor = hafedhColors.errorColor;
                    hafedhErrorMessage = "Wrong username or password!";
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: hafedhColors.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text("LOGIN"),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                hafedhErrorMessage,
                style: TextStyle(
                  color: hafedhMessageColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class hafedhColors {
  static const Color primaryColor = Colors.blueAccent;
  static const Color successColor = Colors.green;
  static const Color errorColor = Colors.red;
}
