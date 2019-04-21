import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://newsapi.org/v2/top-headlines?country=in&apiKey=93fe66b6cc5f4c30b1af7208cd332cee";

class API {
  static Future getArticles() {
    var url = baseUrl;
    return http.get(url);
  }
}