import 'package:flutter/material.dart';
import 'views/splash_view.dart'; // يستدعي شاشة الـ Splash أول ما يفتح

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'جو-ليبي TV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
      ),
      home: const SplashView(), // هنا يفتح شاشة الـ Splash أول شيء توماتيك
    );
  }
}
