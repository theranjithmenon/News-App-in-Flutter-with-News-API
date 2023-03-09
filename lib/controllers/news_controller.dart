import 'package:get/get.dart';
import 'package:tech_news/models/news_article.dart';
import 'package:tech_news/services/news.dart';

class NewsController extends GetxController {
  var articles = <Articles>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      var temp = await NewsService.fetchData();
      if (temp != null) {
        articles(temp);
      }
    } finally {
      isLoading(false);
    }
  }
}
