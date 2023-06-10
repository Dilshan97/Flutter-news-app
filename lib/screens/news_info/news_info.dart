import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/common/colors.dart';
import 'package:news_app/models/news_model.dart';
import 'package:skeletons/skeletons.dart';
import 'package:url_launcher/url_launcher.dart';

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
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_sharp,
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.network(
              widget.news.urlToImage.toString(),
              fit: BoxFit.contain,
              width: size.width,
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
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 8,
                right: 8,
              ),
              child: Text(
                widget.news.title.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.news.author.toString(),
                    style: GoogleFonts.poppins(
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    widget.news.publishedAt.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 15,
              ),
              child: Text(
                widget.news.content.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _launchInBrowser(
                  Uri(
                    scheme: "https",
                    host: 'www.cylog.org',
                    path: '/'
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "View full article",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: AppColors.black,
                    size: 14,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
