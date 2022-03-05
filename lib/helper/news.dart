import 'dart:convert';

import 'package:news_demo_app/model/ArticleModel.dart';
import 'package:http/http.dart' as http;
class News{
  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = 'http://newsapi.org/v2/top-headlines?country=eg&apiKey=e08e69c410cd40c39b59ebc3ea45b148';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element) {
        if(element["urlToImage"] != null && element['description'] != null){

          ArticleModel articleModel= ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
      }
    }
  }
class CategoryNewsClass{
  List<ArticleModel> news = [];

  Future<void> getCategoryNews(String category) async{
    String url = 'http://newsapi.org/v2/top-headlines?category=$category&country=eg&apiKey=e08e69c410cd40c39b59ebc3ea45b148';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element) {
        if(element["urlToImage"] != null && element['description'] != null){

          ArticleModel articleModel= ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

