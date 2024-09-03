import 'package:flutter/material.dart';
import 'exercise_list_page.dart';
import 'workouts_page.dart';


class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String selectedCategory = 'FEATURED';

  Widget getPageContent(String category) {
    switch (category) {
      case 'WORKOUTS':
         return const WorkoutsPage(); // Return the ExerciseListPage
      case 'PLANS':
        return const PlaceholderPage(title: 'PLANS');
      case 'CREATE':
        return const PlaceholderPage(title: 'CREATE');
      default:
        return const PlaceholderPage(title: 'FEATURED');
    }
  }

  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            color: Colors.black,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedButton(text: 'FEATURED', onTap: () => onCategorySelected('FEATURED')),
                  RoundedButton(text: 'WORKOUTS', onTap: () => onCategorySelected('WORKOUTS')),
                  RoundedButton(text: 'PLANS', onTap: () => onCategorySelected('PLANS')),
                  RoundedButton(text: 'CREATE', onTap: () => onCategorySelected('CREATE')),
                ],
              ),
            ),
          ),
        ),
      ),
      body: getPageContent(selectedCategory),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const RoundedButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title, style: const TextStyle(fontSize: 24, color: Colors.white)),
    );
  }
}
