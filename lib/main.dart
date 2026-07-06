import 'package:flutter/material.dart';
import 'views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jo Liby TV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFFD32F2F),
      ),
      home: const SplashView(), // البداية من شاشة الترحيب
    );
  }
}
