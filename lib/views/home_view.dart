import 'package:flutter/material.dart';
import '../live_tv_screen.dart'; // الاستدعاء الصحيح لمكان الملف برة المجلد

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> categories = [
    {'title': 'beIN SPORTS MAX', 'color': Colors.white},
    {'title': 'beIN SPORTS (1080P)', 'color': Colors.white},
    {'title': 'beIN SPORTS (720P)', 'color': Colors.white},
    {'title': 'beIN SPORTS (360P)', 'color': Colors.white},
    {'title': 'beIN ENTERTAINMENT', 'color': Colors.white},
    {'title': 'ARABIC CHANNELS', 'color': Colors.white},
    {'title': 'MBC CHANNELS', 'color': Colors.white},
    {'title': 'KIDS CHANNELS', 'color': Colors.white},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD32F2F),
      appBar: AppBar(
        title: const Text('Jo Liby TV', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFB71C1C),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return ListTile(
            title: Text(item['title'], style: TextStyle(color: item['color'], fontSize: 18, fontWeight: FontWeight.w500)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
            onTap: () {
              // لقطة الانتقال السحرية لما تضغط على أي قناة تمشي للبث طول
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LiveTvScreen()),
              );
            },
          );
        },
      ),
    );
  }
}
