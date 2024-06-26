import 'package:flutter/material.dart';
import 'package:quicknews/Models/Article.dart';
import 'package:quicknews/screens/article_page.dart';

class Newscardwifget extends StatelessWidget {
  Newscardwifget({super.key, required this.article});
  Article article;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        // Open the article in a webview
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ArticlePage(article: article);
        }));
      },
      child: Container(
        height: size.height,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  article.imageURL,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                Text(
                  article.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  article.description.length > 300
                      ? '${article.description.substring(0, 360)}...'
                      : article.description,
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.black12,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "Category : " + article.category,
                    ),
                    const Spacer(),
                    Text(article.timestamp.day.toString() +
                        '/' +
                        article.timestamp.month.toString() +
                        '/' +
                        article.timestamp.year.toString() +
                        ' ' +
                        article.timestamp.hour.toString() +
                        ':' +
                        article.timestamp.minute.toString()),
                  ],
                ),
              ],
            ),
            Positioned(
              child: Icon(
                Icons.ios_share,
                color: Colors.white,
              ),
              right: 10,
              top: 10,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
