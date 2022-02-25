

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/News/Screens/application/controller/news_page_controller.dart';
import 'package:news_app/routes/app_pages.dart';

import 'package:news_app/utils/constants.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Daily News App"),
      ),
      body: GetBuilder<NewsPageController>(builder :(controller) {
        return SafeArea(child: controller.loading
            ? const Center(
                child: CircularProgressIndicator(),
        )
            :controller.noConnection ==true
               ? SizedBox(
                   height: double.infinity,
                   child: Image.asset('asset/images/no_internet.gif',
                     fit: BoxFit.fitHeight,
                   ),
                 )
                 :SingleChildScrollView(
                    child : Column(
                      children: <Widget>[
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.headLineList!.length,
                          itemBuilder: (context, index) {
                            return NewsCard(
                              imageAssetUrl: controller
                                  .headLineList![index].urlToImage,
                              categoryName:
                              controller.headLineList![index].title,
                              cnnValue: controller
                                  .headLineList![index].source!.name,
                              date: convertDateTimeDisplay(controller
                                  .headLineList![index].publishedAt!),
                              description: controller
                                  .headLineList![index].description,
                            );
                          })
                      ],

                    ) ,
        )

        );
      }),

    );
  }
  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormat = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormat.parse(date);
    final String formatted = displayFormat.format(displayDate);
    return formatted;
  }
}

class NewsCard extends StatelessWidget {
  final String? imageAssetUrl, categoryName, cnnValue, date, description;

  NewsCard(
      {this.imageAssetUrl,
        this.categoryName,
        this.cnnValue,
        this.date,
        this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.newsSummary, arguments: [
          categoryName,
          imageAssetUrl,
          cnnValue,
          description,
          date
        ]);
      },
      child: Container(
        margin: const EdgeInsets.all(18.0),
        child: Stack(
          children: <Widget>[
            Hero(
              tag: imageAssetUrl!,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  // ignore this, cos I am giving height to the container
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(imageAssetUrl ??
                              "https://1080motion.com/wp-content/uploads/2018/06/NoImageFound.jpg.png"))),
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(categoryName!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily:
                                  'assets/fonts/RobotoSlab-Regular.ttf')),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(cnnValue!,
                                  style: const TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      fontFamily:
                                      'assets/fonts/RobotoSlab-Regular.ttf')),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(date!,
                                  style: const TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      fontFamily:
                                      'assets/fonts/RobotoSlab-Regular.ttf')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}


class NewsDetails extends StatefulWidget {
  const NewsDetails({Key? key}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    var data= Get.arguments;
    return Scaffold(
      appBar: AppBar(
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: data[1],
              child: Image.network(data[1],
                fit: BoxFit.fitWidth,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.topRight,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: FloatingActionButton(
            //     child: const Icon(Icons.arrow_back),
            //     backgroundColor: Colors.black12,
            //      onPressed: () {
            //     //  Get.back();
            //     },
            //   ),
            // ),
            Padding(padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data[0],
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            fontFamily: 'assets/fonts/RobotoSlab-Regular.ttf')),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [

                        Text(data[2],
                            style:const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize:22.0,
                                fontFamily: 'assets/fonts/RobotoSlab-Regular.ttf')),
                        const Spacer(),
                        Text(data[4],
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                fontFamily:'assets/fonts/RobotoSlab-Regular.ttf'
                            )
                        ),

                      ],
                    ),
                    Text(data[3],
                        textAlign : TextAlign.left,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            fontFamily: 'assets/fonts/RobotoSlab-Regular.ttf'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




