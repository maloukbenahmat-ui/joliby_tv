import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LiveTvScreen extends StatefulWidget {
  const LiveTvScreen({super.key});

  @override
  State<LiveTvScreen> createState() => _LiveTvScreenState();
}

class _LiveTvScreenState extends State<LiveTvScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  String currentChannel = 'قناة الرياضية الليبية HD';

  @override
  void initState() {
    super.initState();
    // 🔗 رابط فيديو تجريبي رسمي ومضمون يشتغل على مشغل فلاتر علطول
    _controller = VideoPlayerController.networkUrl(
      Uri.parse('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
    )..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        _controller.play(); // تشغيل تلقائي
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // 📺 مشغل البث
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.black,
              child: _isInitialized
                  ? VideoPlayer(_controller)
                  : const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(color: Colors.green),
                          SizedBox(height: 12),
                          Text('جاري الاتصال بالبث الحي...', style: TextStyle(color: Colors.white70, fontSize: 13)),
                        ],
                      ),
                    ),
            ),
          ),
          
          // 🔴 رجعنا علامة المباشر باللون الأحمر والاسم
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
          
          // 📺 رجعنا قائمة القنوات الأخرى اللوطية كاملة زي ما طلبت!
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
                _buildChannelItem('قناة الرياضية الليبية HD', 'مباراة اليوم الحية', currentChannel == 'قناة الرياضية الليبية HD'),
                _buildChannelItem('ليبيا الأحرار', 'نشرة الأخبار الرياضية', currentChannel == 'ليبيا الأحرار'),
                _buildChannelItem('قناة بين سبورت الإخبارية', 'تغطية دوري الأبطال', currentChannel == 'قناة بين سبورت الإخبارية'),
                _buildChannelItem('ليبيا الوطنية', 'برامج رياضية منوعة', currentChannel == 'ليبيا الوطنية'),
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
                  Text(description, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                ],
              ),
                ),
            if (isSelected) const Icon(Icons.equalizer, color: Colors.green, size: 20),
          ],
        ),
      ),
    );
  }
}
