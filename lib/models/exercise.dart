class Exercise {
  final String id;
  final String title;
  final String description;
  final String duration;
  final String level;
  final String category;
  final String youtubeUrl;

  Exercise({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.level,
    required this.category,
    required this.youtubeUrl,
  });

  factory Exercise.fromMap(Map<String, dynamic> data, String documentId) {
    return Exercise(
      id: documentId,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      duration: data['duration'] ?? '',
      level: data['level'] ?? '',
      category: data['category'] ?? '',
      youtubeUrl: data['youtubeUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'duration': duration,
      'level': level,
      'category': category,
      'youtubeUrl': youtubeUrl,
    };
  }
}
