import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_app/common/colors.dart';
import 'package:news_app/models/listdata_model.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/screens/home/widgets/CategoryItem.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> categories = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];

  int activeCategory = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.contain,
              color: AppColors.white,
            ),
          ),
        ),
        backgroundColor: AppColors.black,
        elevation: 5,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              size: 34,
              color: AppColors.white,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: size.width,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => CategoryItem(
                  index: index,
                  categoryName: categories[index],
                  activeCategory: activeCategory,
                  onClick: () => {
                    setState(() {
                      activeCategory = index;
                    })
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: size.height * 0.75,
              child: FutureBuilder(
                future: NewsProvider().GetEverything(),
                builder: (builder, snapshot) {
                  if (snapshot.hasData) {
                    List<News> articles = snapshot.data!;
                    return ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                articles[index].urlToImage.toString(),
                              ),
                              Text(
                                articles[index].title.toString(),
                              ),
                              Text(Jiffy.parse(
                                articles[index].publishedAt.toString(),
                              ).fromNow().toString()),
                              Text(
                                articles[index].description.toString(),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
