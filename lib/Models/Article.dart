import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  String imageURL;
  String title;
  String description;
  DateTime timestamp;
  String category;
  Article({
    required this.imageURL,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.category,
  });

  factory Article.fromDocument(DocumentSnapshot doc) {
    return Article(
      imageURL: doc['imageURL'] as String,
      title: doc['title'] as String,
      description: doc['description'] as String,
      timestamp: doc['timestamp'].toDate() as DateTime,
      category: doc['category'] as String,
    );
  }
  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      imageURL: map['imageURL'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      category: map['category'] as String,
    );
  }
}
