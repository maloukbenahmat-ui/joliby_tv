import 'package:flutter/material.dart';

class LiveTvScreen extends StatefulWidget {
  const LiveTvScreen({super.key});

  @override
  State<LiveTvScreen> createState() => _LiveTvScreenState();
}

class _LiveTvScreenState extends State<LiveTvScreen> {
  bool isPlaying = true;
  bool isMuted = false;
  String currentChannel = 'قناة الرياضية الليبية HD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          currentChannel,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // 📺 منطقة مشغل الفيديو (التصميم الافتراضي للمشغل)
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.black,
              stackTrace: null,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // خلفية المشغل في غياب البث المباشر الفعلي حالياً
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.live_tv, size: 50, color: Colors.green),
                      const SizedBox(height: 8),
                      Text(
                        'جاري الاتصال بالبث الحي...',
                        style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 13),
                      ),
                    ],
                  ),
                  // شريط التحكم السفلي داخل المشغل
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      color: Colors.black54,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                isPlaying = !isPlaying;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              isMuted ? Icons.volume_off : Icons.volume_up,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                isMuted = !isMuted;
                              });
                            },
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white30),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              '1080p',
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.fullscreen, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // 📊 تفاصيل القناة الحالية
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'مباشر',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    currentChannel,
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          
          const Divider(color: Color(0xFF2A2A2A)),
          
          // 📺 قائمة القنوات المتاحة للبث
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const Padding(
                  padding: EdgeInsets.vertical(12),
                  child: Text(
                    'قنوات بث أخرى',
                    style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                _buildChannelItem('قناة الرياضية الليبية HD', 'مباراة اليوم الحية', true),
                _buildChannelItem('ليبيا الأحرار', 'نشرة الأخبار الرياضية', false),
                _buildChannelItem('قناة بين سبورت الإخبارية', 'تغطية دوري الأبطال', false),
                _buildChannelItem('ليبيا الوطنية', 'برامج رياضية منوعة', false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChannelItem(String name, String description, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentChannel = name;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1A2E1A) : Colors.transparent,
          border: Border.all(color: isSelected ? Colors.green.withOpacity(0.5) : const Color(0xFF2A2A2A)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(Icons.play_circle_fill, color: isSelected ? Colors.green : Colors.grey, size: 30),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.grey, fontSize: 11),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.equalizer, color: Colors.green, size: 20),
          ],
        ),
      ),
    );
  }
}
