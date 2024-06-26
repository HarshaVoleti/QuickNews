import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:quicknews/Models/Article.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({super.key, required this.article});
  Article article;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ColorfulSafeArea(
      bottom: false,
      color: Colors.white,
      child: Scaffold(
        body: Container(
          height: size.height,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      widget.article.imageURL,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 10,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    widget.article.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.black12,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                    left: 10,
                    right: 10,
                    bottom: 5.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Category : " + widget.article.category,
                      ),
                      const Spacer(),
                      Text(widget.article.timestamp.day.toString() +
                          '/' +
                          widget.article.timestamp.month.toString() +
                          '/' +
                          widget.article.timestamp.year.toString() +
                          ' ' +
                          widget.article.timestamp.hour.toString() +
                          ':' +
                          widget.article.timestamp.minute.toString()),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.black12,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    widget.article.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          child: Icon(
            Icons.share_sharp,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Functionality yet to be added'),
              ),
            );
          },
        ),
      ),
    );
  }
}
