import 'package:flutter/material.dart';
import 'signup.dart'; // Import the SignupPage

void main() {
  runApp(const SOSApp());
}

class SOSApp extends StatelessWidget {
  const SOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOS',
      theme: ThemeData(
        primarySwatch: Colors.red, // Keeping the red theme for SOS
      ),
      home: const SOSHomePage(),
    );
  }
}

class SOSHomePage extends StatelessWidget {
  const SOSHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safevox', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black, // Match the dark background
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textStyle: const TextStyle(fontSize: 20),
            backgroundColor: Colors.red, // Match the SOS theme
            foregroundColor: Colors.white, // White text for contrast
          ),
          child: const Text('Get Started'),
        ),
      ),
    );
  }
}