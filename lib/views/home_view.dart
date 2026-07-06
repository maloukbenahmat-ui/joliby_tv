import 'package:flutter/material.dart';
import '../models/channel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // قائمة القنوات التجريبية مقسمة حسب الفئة (زي ياسين تيفي)
  final List<Channel> channels = [
    // قسم قنوات ليبيا
    Channel(name: 'الرياضية الليبية', logo: 'https://via.placeholder.com/150', url: 'https://example.com/libya_sports.m3u8', category: 'قنوات ليبيا 🇱🇾'),
    Channel(name: 'ليبيا الأحرار', logo: 'https://via.placeholder.com/150', url: 'https://example.com/libya_alahrar.m3u8', category: 'قنوات ليبيا 🇱🇾'),
    Channel(name: 'قناة سلام', logo: 'https://via.placeholder.com/150', url: 'https://example.com/salam.m3u8', category: 'قنوات ليبيا 🇱🇾'),
    
    // قسم قنوات الرياضة العالمية
    Channel(name: 'beIN SPORTS 1', logo: 'https://via.placeholder.com/150', url: 'https://example.com/bein1.m3u8', category: 'بين سبورت ⚽'),
    Channel(name: 'beIN SPORTS 2', logo: 'https://via.placeholder.com/150', url: 'https://example.com/bein2.m3u8', category: 'بين سبورت ⚽'),
    Channel(name: 'SSC SPORTS 1', logo: 'https://via.placeholder.com/150', url: 'https://example.com/ssc1.m3u8', category: 'قنوات SSC السعودية 🇸🇦'),
  ];

  @override
  Widget build(BuildContext context) {
    // الحصول على الفئات الفريدة (ليبيا، بين سبورت، إلخ)
    final categories = channels.map((c) => c.category).toSet().toList();

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('JOLIBY TV - الرئيسية', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color(0xFF1E1E1E),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final categoryChannels = channels.where((c) => c.category == category).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // عنوان القسم (مثل: قنوات ليبيا)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  category,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.amber),
                ),
              ),
              // قائمة القنوات الخاصة بهذا القسم بشكل أفقي أو شبكي
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryChannels.length,
                  itemBuilder: (context, cIndex) {
                    final channel = categoryChannels[cIndex];
                    return Container(
                      width: 120,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.play_circle_fill, size: 40, color: Colors.red),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              channel.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Divider(color: Colors.grey, thickness: 0.2),
            ],
          );
        },
      ),
    );
  }
}
