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
  final TextEditingController hafedhEmailController = TextEditingController();

  String hafedhErrorMessage = "";
  Color hafedhMessageColor = Colors.black;

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: HafedhColors.primaryColor,
        titleTextStyle: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.lightBlue.shade50,
      body: Center(
        child: Container(
          width: 350, // تحديد عرض الـ Container
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Welcome Hafedh!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: HafedhColors.primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: hafedhNameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: hafedhEmailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: hafedhPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (!isValidEmail(hafedhEmailController.text)) {
                    setState(() {
                      hafedhErrorMessage = "يجب إدخال بريد الكتروني صالح";
                      hafedhMessageColor = HafedhColors.errorColor;
                    });
                  } else if (hafedhNameController.text == "hafedh" &&
                      hafedhPasswordController.text == "123") {
                    setState(() {
                      hafedhErrorMessage = "Login successful!";
                      hafedhMessageColor = HafedhColors.successColor;
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HafedhWelcomeScreen(
                          hafedhUserName: hafedhNameController.text,
                          hafedhEmail: hafedhEmailController.text,
                          hafedhPassword: hafedhPasswordController.text,
                        ),
                      ));
                    });
                  } else {
                    setState(() {
                      hafedhMessageColor = HafedhColors.errorColor;
                      hafedhErrorMessage = "أسم المستخدم أو كلمة المرور خاطئة";
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: HafedhColors.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  foregroundColor: Colors.white,
                ),
                child: const Text("LOGIN"),
              ),
              const SizedBox(height: 10),
              Text(
                hafedhErrorMessage,
                style: TextStyle(
                  color: hafedhMessageColor,
                  fontWeight: FontWeight.bold,
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
  static const Color successColor = Colors.green;
  static const Color errorColor = Colors.red;
}
