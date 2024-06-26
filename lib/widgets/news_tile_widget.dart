import 'package:flutter/material.dart';
import 'package:quicknews/Models/Article.dart';
import 'package:quicknews/screens/article_page.dart';

class NewsTileWidget extends StatelessWidget {
  NewsTileWidget({super.key, required this.article});
  Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Open the article in a webview
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ArticlePage(article: article);
        }));
      },
      child: Container(
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
                  article.description.length > 200
                      ? '${article.description.substring(0, 200)}...'
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
  }
}
