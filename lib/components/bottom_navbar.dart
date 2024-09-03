import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int) onTap;
  final int selectedIndex;

  const BottomNavBar({super.key, required this.onTap, required this.selectedIndex});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'EXPLORE',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box),
          label: 'CREATE',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart),
          label: 'PROGRESS',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'SETTINGS',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      onTap: widget.onTap,
      type: BottomNavigationBarType.fixed,  // This ensures the background color covers the entire bar
    );
  }
}
