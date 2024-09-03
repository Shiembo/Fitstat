import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/exercise.dart';

class ExerciseDetailPage extends StatefulWidget {
  final Exercise exercise;

  const ExerciseDetailPage({super.key, required this.exercise});

  @override
  _ExerciseDetailPageState createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  late YoutubePlayerController _controller;
  double _progressPercentage = 0.0;
  bool _workoutStarted = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.exercise.youtubeUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    _controller.addListener(_videoProgressListener);
  }

  void _videoProgressListener() {
    if (_controller.value.isPlaying) {
      setState(() {
        _workoutStarted = true;
        _progressPercentage = (_controller.value.position.inSeconds / _controller.metadata.duration.inSeconds) * 100;
      });
    }
  }

  void _endWorkout() async {
    // Get the current user's ID
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Save progress to Firestore under the user's unique ID
      FirebaseFirestore.instance.collection('user_progress').add({
        'exerciseId': widget.exercise.id,
        'progressPercent': _progressPercentage,
        'timestamp': FieldValue.serverTimestamp(),
        'userId': user.uid, // Use the authenticated user's ID
      });

      // Navigate back or to a summary screen
      Navigator.of(context).pop();
    } else {
      // Handle the case where the user is not authenticated
      // You may want to redirect them to a login screen or show an error message
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoProgressListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Exercise Details', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayer(controller: _controller),
              const SizedBox(height: 16),
              Text(widget.exercise.title, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('${widget.exercise.duration} mins   ${widget.exercise.level}', style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),
              Text(widget.exercise.description, style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _workoutStarted ? _endWorkout : null,
                child: const Text('END WORKOUT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
