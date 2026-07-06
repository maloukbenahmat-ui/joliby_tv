import 'package:flutter/material.dart';

void main() {
  runApp(const JoLibyTVApp());
}

class JoLibyTVApp extends StatelessWidget {
  const JoLibyTVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JoLiby TV',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          centerTitle: true,
        ),
      ),
      home: const MainChannelsPage(),
    );
  }
}

class MainChannelsPage extends StatelessWidget {
  const MainChannelsPage({super.key});

  final List<Map<String, String>> channels = const [
    {'name': 'بي إن سبورت 1', 'desc': 'بث مباشر للمباريات HD'},
    {'name': 'بي إن سبورت 2', 'desc': 'بث مباشر للمباريات HD'},
    {'name': 'بي إن سبورت الإخبارية', 'desc': 'أخبار الرياضة العالمية'},
    {'name': 'أبوظبي الرياضية', 'desc': 'البطولات العربية والعالمية'},
    {'name': 'الكأس القطرية', 'desc': 'تغطية مستمرة ومباشرة'},
    {'name': 'المغربية الرياضية', 'desc': 'البطولات الإفريقية والمحلية'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JOLIBY TV - الرئيسية',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.1,
          ),
          itemCount: channels.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color(0xFF1E1E1E),
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('جاري تشغيل ${channels[index]['name']}...')),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.play_circle_fill, size: 50, color: Colors.red),
                      const SizedBox(height: 10),
                      Text(
                        channels[index]['name']!,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        channels[index]['desc']!,
                        style: const TextStyle(color: Colors.grey, fontSize: 11),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

