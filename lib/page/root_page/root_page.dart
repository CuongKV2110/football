import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../constants/constants.dart';
import '../home_page/home_page.dart';
import '../menu_page/menu_page.dart';
import '../news_page/news_page.dart';
import '../search_page/search_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;
  final PageController _pageController =
      PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGrayd2,
      body: PageView(
        controller: _pageController,
        children: const [
          HomePage(),
          SearchPage(),
          NewsPage(),
          MenuPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
              _pageController.jumpToPage(selectedIndex);
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Ionicons.home_outline),
              label: "Home",
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.search_outline),
              label: "Search",
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.book_outline),
              label: "News",
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.list_circle_outline),
              label: "Menu",
              backgroundColor: Colors.black,
            ),
          ]),
    );
  }
}
