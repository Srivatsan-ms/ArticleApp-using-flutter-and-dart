import 'dart:convert';
import 'package:firstapp/modelfile/articlemodel.dart';
import 'package:http/http.dart' as http;

class NewsArticles {
  List<ArticleModel> article = [];
  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&apiKey=99f725a2a94d4b33a5236d736bd4ab0f";
    var response = await http.get(url);
    var jsonData = json.decode(response.body);
    if (jsonData["status"] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            url: element['url'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );

          article.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsArticles {
  List<ArticleModel> article = [];
  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=99f725a2a94d4b33a5236d736bd4ab0f";
    var response = await http.get(url);
    var jsonData = json.decode(response.body);
    if (jsonData["status"] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            url: element['url'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          article.add(articleModel);
        }
      });
    }
  }
}
