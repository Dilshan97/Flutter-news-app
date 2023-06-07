import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_app/common/colors.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/news_info/news_info.dart';
import 'package:skeletons/skeletons.dart';

class NewsCard extends StatefulWidget {
  final News article;

  const NewsCard({
    super.key,
    required this.article,
  });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => NewsInfo(
              news: widget.article,
            ),
          ),
        )
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.article.urlToImage.toString(),
                fit: BoxFit.contain,
                frameBuilder: (BuildContext context, Widget child, int? frame,
                    bool wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child; 
                  if (frame == null) {
                    return Center(
                      child: Skeleton(
                        isLoading: true,
                        skeleton: SkeletonParagraph(),
                        child: const Text(''),
                      ),
                    );
                  }
                  return child;
                },
              ),
              Text(
                widget.article.title.toString(),
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.article.author.toString(),
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    Jiffy.parse(
                      widget.article.publishedAt.toString(),
                    ).fromNow().toString(),
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                widget.article.description.toString(),
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
