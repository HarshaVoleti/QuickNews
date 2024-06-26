import 'package:flutter/material.dart';

class NewsTileLoading extends StatelessWidget {
  NewsTileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Open the article in a webview
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return ArticlePage(article: article);
        // }));
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
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(""),
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
                      "Category : ",
                    ),
                    const Spacer(),
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
