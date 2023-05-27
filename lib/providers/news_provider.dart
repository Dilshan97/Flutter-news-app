import 'dart:convert';

import 'package:news_app/models/listdata_model.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/Api.dart';

class NewsProvider {
  Future<List<News>> GetEverything() async {
    List<News> articles = [];
    await ApiService().getEverything().then((response) {
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body)['articles'];
        articles = data.map((e) => News.fromJson(e)).toList();
      } else {
        throw Exception(response.statusCode);
      }
    });
    return articles;
  }
}
