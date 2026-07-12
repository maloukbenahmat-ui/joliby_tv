import 'package:flutter/material.dart';
import 'home_view.dart'; // الربط الصحيح مع شاشة الرئيسية المعدلة

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // يخلي شاشة الإقلاع تقعد 3 ثواني وبعدها تنتقل تلقائياً للرئيسية
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0F0F0F), // نفس لون الثيم الغامق للتطبيق
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // أيقونة التلفزيون وشعار التطبيق
            Icon(
              Icons.live_tv,
              size: 80,
              color: Colors.green,
            ),
            SizedBox(height: 16),
            Text(
              'جو-ليبي TV',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'البث المباشر للمباريات',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
