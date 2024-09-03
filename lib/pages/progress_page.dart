import 'package:flutter/material.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'PROGRESS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PersonalBestCard(label: 'Deadlift', weight: '-'),
                  PersonalBestCard(label: 'Squat', weight: '-'),
                  PersonalBestCard(label: 'Bench Press', weight: '-'),
                ],
              ),
            ),
            Divider(color: Colors.white70),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '2024',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'JULY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            WorkoutCard(
              title: 'ABS WITH ANNA',
              trainer: 'ANNA ARCHER',
              time: '19:49, 09 July 2024 (0 secs)',
              progress: 0,
            ),
            WorkoutCard(
              title: 'ABS WITH ANNA',
              trainer: 'ANNA ARCHER',
              time: '19:37, 09 July 2024 (20 secs)',
              progress: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalBestCard extends StatelessWidget {
  final String label;
  final String weight;

  const PersonalBestCard({super.key, required this.label, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              '$weight\nKG',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String title;
  final String trainer;
  final String time;
  final int progress;

  const WorkoutCard({super.key, 
    required this.title,
    required this.trainer,
    required this.time,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              trainer,
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'ROUND',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    '% COMPLETED',
                    style: TextStyle(color: Colors.white70),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'ABS WITH ANNA',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '$progress%',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
