import 'package:flutter/material.dart';
import 'live_tv_screen.dart'; // استدعاء الشاشة الجديدة بالنظيف

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جو ليبي - الرئيسية'),
        backgroundColor: const Color(0xFFD32F2F),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'مرحباً بك في تطبيق جو ليبي',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD32F2F),
              ),
              onChanged: null,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LiveTvScreen()),
                );
              },
              child: const Text('الانتقال للبث المباشر', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
