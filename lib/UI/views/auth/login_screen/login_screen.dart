import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          cust(
              TextInputType.emailAddress,
              'hint',
              Text(
                'data',
              ))
        ],
      ),
    );
  }

  TextField cust(keyboard, hint, label) {
    return TextField(
      keyboardType: keyboard,
      decoration: InputDecoration(
          hintText: hint,
          label: label,
          hintStyle: TextStyle(color: Colors.red)),
    );
  }
}
