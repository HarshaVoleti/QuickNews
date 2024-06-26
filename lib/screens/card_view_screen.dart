import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quicknews/Models/Article.dart';
import 'package:quicknews/functions/fetchfunctions.dart';
import 'package:quicknews/widgets/news_tile_widget.dart';
import 'package:quicknews/widgets/newscardWidget.dart';
import 'package:quicknews/widgets/newscardloading.dart';
import 'package:quicknews/widgets/newstileloading.dart';

class CardViewScreen extends StatefulWidget {
  const CardViewScreen({super.key});

  @override
  State<CardViewScreen> createState() => _CardViewScreenState();
}

class _CardViewScreenState extends State<CardViewScreen> {
  // final List<Article> articles = [];
  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance.collection("news").get().then((querySnapshot) {
  //     List<Article> fetchedArticles = [];
  //     for (var doc in querySnapshot.docs) {
  //       fetchedArticles.add(Article.fromMap(doc.data()));
  //     }
  //     setState(() {
  //       articles.addAll(fetchedArticles);
  //     });
  //   }).catchError((error) {
  //     print("Error fetching articles: $error");
  //   });
  // }

  // void removeCard(int index) {
  //   setState(() {
  //     articles.removeAt(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick News'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Container(
        color: Colors.white,
        height: size.height,
        width: size.width,
        child: FutureBuilder(
            future: fetchArticles(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: NewsCardLoading(),
                );
              }
              if (!snapshot.hasData) {
                return Container(
                  width: size.width * 0.9,
                  height: size.height * 0.7,
                  child: Center(
                    child: Text("out of news, refresh to update"),
                  ),
                );
              }
              return Stack(
                alignment: Alignment.center,
                children: List.generate(snapshot.data!.length, (index) {
                  print("started");

                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      // removeCard(index);
                    },
                    child: SizedBox(
                      width: size.width * 0.9,
                      height: size.height * 0.7,
                      child: Newscardwifget(
                        article: Article.fromDocument(
                          snapshot.data![index],
                        ),
                      ),
                    ),
                  );
                }),
              );
            }),
      ),
    );
  }
}
