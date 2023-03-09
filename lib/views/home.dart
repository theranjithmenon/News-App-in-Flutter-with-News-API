import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_news/controllers/news_controller.dart';
import 'package:tech_news/views/details.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final NewsController _newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Obx(() {
            return (_newsController.isLoading.value)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemCount: _newsController.articles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ArticleDetails(index: index)));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(_newsController
                                            .articles[index].urlToImage
                                            .toString()),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _newsController.articles[index].title
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  );
          }),
        ));
  }
}
