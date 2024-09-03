import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/components/top_navbar.dart';
import '/components/bottom_navbar.dart';
import 'explore_page.dart';
import 'create_page.dart';
import 'progress_page.dart';
import 'settings_page.dart';
import 'workouts_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ExplorePage(),
    CreatePage(),
    ProgressPage(),
    SettingsPage(),
    WorkoutsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
