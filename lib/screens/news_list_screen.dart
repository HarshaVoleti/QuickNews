import 'package:flutter/material.dart';
import 'package:quicknews/Models/Article.dart';
import 'package:quicknews/functions/fetchfunctions.dart';
import 'package:quicknews/widgets/news_tile_widget.dart';
import 'package:quicknews/widgets/newstileloading.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  Article? firstArticle;
  List<Article> remainingArticles = [];
  bool isLoadingFirstArticle = true;
  bool isLoadingRemainingArticles = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick News'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<Article?>(
                future: fetchFirstArticle(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    return NewsTileWidget(article: snapshot.data!);
                  } else {
                    return Text('No article available');
                  }
                },
              ),
              // Display the remaining articles using another FutureBuilder
              FutureBuilder(
                future: fetchRemainingArticles(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: NewsTileLoading(),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return NewsTileWidget(
                          article: Article.fromDocument(
                            snapshot.data![index],
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('No articles available'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
