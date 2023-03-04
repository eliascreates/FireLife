import 'package:firelogin_prac/pages/profile_page.dart';
import 'package:firelogin_prac/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  var _pageIndex = 0;

  void selectPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.deepOrangeAccent,
          showUnselectedLabels: true,
          currentIndex: _pageIndex,
          onTap: selectPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
            BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Mail'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
        body: Nav.pages[_pageIndex]);
  }
}

class Nav {
  static List<Widget> pages = [
    const Center(child: Text('Home Page')),
    const SearchPage(),
    const Center(child: Text('Add Page')),
    const Center(child: Text('Mail Page')),
    ProfilePage(),
  ];
}
