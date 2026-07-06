import 'package:flutter/material.dart';
import 'home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // الانتقال للواجهة الرئيسية بعد 3 ثوانٍ تلقائياً
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB71C1C), // اللون الأحمر الفخم
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // أيقونة التلفزيون الكبيرة كشعار مؤقت قنين
            const Icon(
              Icons.tv_rounded,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 24),
            // اسم التطبيق الترحيبي
            const Text(
              'Jo Liby TV',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'يرحب بكم',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 48),
            // مؤشر التحميل الدائري باللون الأبيض
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
