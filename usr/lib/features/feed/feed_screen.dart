import 'package:flutter/material.dart';
import 'video_post_widget.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> _mockVideos = [
    {
      'username': '@flutter_dev',
      'description': 'Building a TikTok clone in Flutter! #flutter #dev',
      'songName': 'Original Sound - Flutter Dev',
      'likes': '1.2M',
      'comments': '45K',
      'shares': '12K',
      'color': Colors.blueGrey.shade900,
    },
    {
      'username': '@creative_coder',
      'description': 'Smooth page transitions are so satisfying. 📱',
      'songName': 'Coding Vibes - Chill',
      'likes': '854K',
      'comments': '12K',
      'shares': '4K',
      'color': Colors.deepPurple.shade900,
    },
    {
      'username': '@design_enthusiast',
      'description': 'UI/UX tips for mobile apps. Keep it clean!',
      'songName': 'Design Thinking - Focus',
      'likes': '432K',
      'comments': '3K',
      'shares': '1K',
      'color': Colors.teal.shade900,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: _mockVideos.length,
            itemBuilder: (context, index) {
              final video = _mockVideos[index];
              return VideoPostWidget(
                username: video['username'],
                description: video['description'],
                songName: video['songName'],
                likes: video['likes'],
                comments: video['comments'],
                shares: video['shares'],
                backgroundColor: video['color'],
              );
            },
          ),
          
          // Top Navigation (Following / For You)
          SafeArea(
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Following',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    '|',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    'For You',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
