import 'package:flutter/material.dart';
import 'package:news_app/common/colors.dart';
import 'package:news_app/models/news_model.dart';

class NewsInfo extends StatefulWidget {
  final News news;

  const NewsInfo({
    super.key,
    required this.news,
  });

  @override
  State<NewsInfo> createState() => _NewsInfoState();
}

class _NewsInfoState extends State<NewsInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(widget.news.title.toString()),
      ),
    );
  }
}
