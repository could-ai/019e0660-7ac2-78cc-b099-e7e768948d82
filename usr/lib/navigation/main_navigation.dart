import 'package:flutter/material.dart';

import '../features/feed/feed_screen.dart';
import '../features/profile/profile_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const FeedScreen(),
    const Center(child: Text('Discover', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Add Video', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Inbox', style: TextStyle(fontSize: 24))),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // When on the feed screen, the navigation bar needs to be transparent or dark to blend with videos
    final isHome = _currentIndex == 0;
    
    return Scaffold(
      backgroundColor: isHome ? Colors.black : Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          _screens[_currentIndex],
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: isHome ? Colors.black : Theme.of(context).scaffoldBackgroundColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: isHome ? Colors.white : Theme.of(context).colorScheme.primary,
          unselectedItemColor: isHome ? Colors.white54 : Colors.grey.shade600,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          elevation: 0,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              activeIcon: Icon(Icons.search, size: 28),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: _buildAddButton(isHome),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              activeIcon: Icon(Icons.chat_bubble),
              label: 'Inbox',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(bool isHome) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      height: 32,
      width: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: Container(
              width: 38,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 38,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            child: Container(
              width: 38,
              height: 32,
              decoration: BoxDecoration(
                color: isHome ? Colors.white : Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.add,
                color: isHome ? Colors.black : Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
