import 'package:flutter/material.dart';
import 'package:freels/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _screenIndex = 0;
  void onTapped(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _screenIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: screenTitles[0]),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: screenTitles[1]),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: screenTitles[2]),
          BottomNavigationBarItem(
              icon: Icon(Icons.message), label: screenTitles[3]),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: screenTitles[4]),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        onTap: onTapped,
      ),
    );
  }
}
