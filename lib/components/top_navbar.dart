import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Text(
        'EXPLORE',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.bookmark_border, color: Colors.white, size: 28),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white, size: 28),
          onPressed: () {},
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Container(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('FEATURED', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('WORKOUTS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('PLANS', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('CREATE', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
