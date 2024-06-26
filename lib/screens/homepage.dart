import 'package:flutter/material.dart';
import 'package:quicknews/screens/card_view_screen.dart';
import 'package:quicknews/screens/news_list_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: index == 0 ? NewsListScreen() : CardViewScreen(),
      //a bottom navigation bar to change from listpage to cards pages in tabs
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        enableFeedback: false,
        backgroundColor: Colors.white,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "List View",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.style_sharp,
            ),
            label: "Card View",
          ),
        ],
      ),
    );
  }
}
