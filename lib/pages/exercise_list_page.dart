import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'exercise_detail_page.dart';
import '../models/exercise.dart';

class ExerciseListPage extends StatelessWidget {
  final String filterKey;
  final String filterValue;

  const ExerciseListPage({
    super.key,
    required this.filterKey,
    required this.filterValue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(filterValue, style: const TextStyle(color: Colors.white)),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('exercises')
            .where(filterKey, isEqualTo: filterValue)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.active) {
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No exercises found', style: TextStyle(color: Colors.white)));
            } else {
              // Debug: Print filterKey and filterValue
              print("filterKey: $filterKey, filterValue: $filterValue");

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final exercise = Exercise.fromMap(
                    snapshot.data!.docs[index].data() as Map<String, dynamic>,
                    snapshot.data!.docs[index].id,
                  );
                  return ListTile(
                    title: Text(exercise.title, style: const TextStyle(color: Colors.white)),
                    subtitle: Text('${exercise.duration} mins   ${exercise.level}', style: const TextStyle(color: Colors.grey)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ExerciseDetailPage(exercise: exercise)),
                      );
                    },
                  );
                },
              );
            }
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.white)));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
