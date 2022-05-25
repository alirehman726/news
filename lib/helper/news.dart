import 'package:http/http.dart' as http;
import 'package:news/model/article_model.dart';
import 'dart:convert';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=420d80f9ba894f289be126f051267f87";
    print('response');

    // var response = await http.get(Uri.parse(url));
    var response = await http.get(Uri.parse(url));
    print(response.body);
    print(response.statusCode);

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          print(
              'object_____________________________________________________________object');
          ArticleModel article = ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element["url"],
            urlToImage: element['urlToImage'],
            content: element["content"],
            // publshedAt: DateTime.parse(element['publishedAt']),
          );
        
          news.add(article);
        }
      });
    }
  }
}
