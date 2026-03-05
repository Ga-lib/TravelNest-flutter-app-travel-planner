import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const WanderListApp());
}

class WanderListApp extends StatelessWidget {
  const WanderListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WanderList',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
