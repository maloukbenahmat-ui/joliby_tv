import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // قائمة الأقسام الرئيسية بنفس ستايل ياسين تيفي
    final List<Map<String, dynamic>> categories = [
      {'title': 'beIN SPORTS MAX', 'color': Colors.white},
      {'title': 'beIN SPORTS (1080P)', 'color': Colors.white},
      {'title': 'beIN SPORTS (720P)', 'color': Colors.white},
      {'title': 'beIN SPORTS (360P)', 'color': Colors.white},
      {'title': 'beIN ENTERTAINMENT', 'color': Colors.white},
      {'title': 'ARABIC CHANNELS (القنوات العربية)', 'color': Colors.white},
      {'title': 'MBC CHANNELS', 'color': Colors.white},
      {'title': 'KIDS CHANNELS (قنوات الأطفال)', 'color': Colors.white},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFD32F2F), // الخلفية الحمراء الخاصة بالتطبيق
      appBar: AppBar(
        title: const Text(
          'Jo Liby TV', 
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)
        ),
        backgroundColor: const Color(0xFFB71C1C),
        centerTitle: true,
        elevation: 2,
        leading: const Icon(Icons.menu, color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            height: 65,
            decoration: BoxDecoration(
              color: item['color'],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                )
              ],
            ),
                    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LiveTvScreen(),
          ),
        );
      },
      child: Center،(
                child: Text(
                  item['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFB71C1C), // نص أحمر داكن متناسق
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'sans-serif',
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFB71C1C),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'LIVE TV'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'LIVE EVENT'),
        ],
      ),
    );
  }
}
