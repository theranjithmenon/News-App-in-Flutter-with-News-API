import 'package:http/http.dart' as http;
import 'package:tech_news/models/news_article.dart';

class NewsService {
  static var client = http.Client();

  static Future<List<Articles>?> fetchData() async {
    var response = await client.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=apple&from=2023-03-08&to=2023-03-08&sortBy=popularity&apiKey=20c8590a628f406d924d7412cfcf4bc8'));
    if (response.statusCode == 200) {
      return articlesFromJson(response.body);
    } else {
      return null;
    }
  }
}
