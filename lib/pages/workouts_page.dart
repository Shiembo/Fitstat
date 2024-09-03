import 'package:flutter/material.dart';
import 'exercise_list_page.dart'; // Import the ExerciseListPage

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'WORKOUTS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            FilterCategory(
              title: 'BY TYPE',
              filters: ['Bodyweight', 'Cardio', 'Free Weights'],
              filterKey: 'category', // Pass the filter key
            ),
            FilterCategory(
              title: 'BY DURATION',
              filters: ['15 mins', '30 mins', '45 mins'],
              filterKey: 'duration', // Pass the filter key
            ),
            FilterCategory(
              title: 'BY EQUIPMENT',
              filters: ['Barbell', 'Dumbbell', 'Full Gym'],
              filterKey: 'equipment', // Pass the filter key
            ),
            FilterCategory(
              title: 'BY BODY PART',
              filters: ['Upper Body', 'Lower Body', 'Full Body'],
              filterKey: 'bodyPart', // Pass the filter key
            ),
          ],
        ),
      ),
    );
  }
}

class FilterCategory extends StatelessWidget {
  final String title;
  final List<String> filters;
  final String filterKey; // Add a filterKey parameter

  const FilterCategory({
    super.key,
    required this.title,
    required this.filters,
    required this.filterKey, // Initialize the filterKey
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            itemBuilder: (context, index) {
              return FilterCard(
                title: filters[index],
                filterKey: filterKey, // Pass the filterKey
              );
            },
          ),
        ),
      ],
    );
  }
}

class FilterCard extends StatelessWidget {
  final String title;
  final String filterKey; // Add a filterKey parameter

  const FilterCard({
    super.key,
    required this.title,
    required this.filterKey, // Initialize the filterKey
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // Navigate to ExerciseListPage with the selected filter
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExerciseListPage(filterKey: filterKey, filterValue: title),
            ),
          );
        },
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
