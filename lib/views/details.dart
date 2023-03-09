import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/news_controller.dart';

class ArticleDetails extends StatelessWidget {
  ArticleDetails({Key? key, required this.index}) : super(key: key);
  int index;
  final NewsController _newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: NetworkImage(_newsController
                        .articles[index].urlToImage
                        .toString()),
                    fit: BoxFit.cover)),
          ),
          Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _newsController.articles[index].title.toString(),
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    _newsController.articles[index].publishedAt.toString(),
                    style: const TextStyle(fontSize: 10),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    _newsController.articles[index].description.toString(),
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
