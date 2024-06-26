import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quicknews/Models/Article.dart';

Future<Article?> fetchFirstArticle() async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('news')
      .orderBy("timestamp", descending: true)
      .limit(1)
      .get();
  if (querySnapshot.docs.isNotEmpty) {
    return Article.fromDocument(querySnapshot.docs.first);
  }
  return null;
}

Future<List<QueryDocumentSnapshot<Object?>>> fetchRemainingArticles() async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('news')
      .orderBy("timestamp", descending: true)
      .get();
  return querySnapshot.docs.skip(1).toList();
}

Future<List<QueryDocumentSnapshot<Object?>>> fetchArticles() async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('news')
      .orderBy("timestamp", descending: true)
      .get();
  return querySnapshot.docs.toList();
}
