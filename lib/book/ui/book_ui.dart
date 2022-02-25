
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/book/application/controller/BookController.dart';


class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  var book = Get.find<BookController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookController>(builder: (bcontroller) {
      return Scaffold(
        appBar: AppBar(title: const Text("Welcome to Books")),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () {
              return book.getBooksApi("cancer");
            },
            child: Column(
              children: [
                Expanded(
                  child: bcontroller.noInternet == true
                      ? const Center(
                       child: CircularProgressIndicator(),
                  )
                      : ListView.builder(
                      itemCount: bcontroller.bookModelList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bcontroller.bookModelList[index]
                                      .volumeInfo!.title ??
                                      "",
                                  style: const TextStyle(
                                      fontFamily: 'Montserrat' ,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 15),
                                ExpandableText(
                                  bcontroller.bookModelList[index]
                                      .volumeInfo!.description ??
                                      "",
                                  expandText: 'read more',
                                  collapseText: 'read less',
                                  maxLines: 1,
                                  linkColor: Colors.pink,

                                  //colorClickableText: Colors.pink,
                                  //trimMode: TrimMode.Line,
                                  //trimCollapsedText: 'Show more',
                                  //trimExpandedText: 'Show less',
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}