import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news_app/book/domain/book_model.dart';



class BookController extends GetxController {
  /// very first method call in controller
  @override
  void onInit() {
    super.onInit();
    //getNewsDataFromApi();
    getBooksApi("cancer");
  }


  /*get call for news api*/
  final client = Dio();
  bool loading = false;


  List<Items> bookModelList = [];
  bool noInternet = false;

  updateListLoading(bool val) {
    loading = val;
    update();
  }
  // getNewsDataFromApi() async {
  //   try {
  //     ///https://newsapi.org/v2/top-headlines?country=us&apiKey=8780cdf148154a18b52efe8b1f666b58
  //     var noInternetConnectivity = await (Connectivity().checkConnectivity());
  //     if (noInternetConnectivity == ConnectivityResult.mobile ||
  //         noInternetConnectivity == ConnectivityResult.wifi) {
  //       updateListLoading(true);
  //       noInternet = false;
  //       update();
  //       var response =
  //       await client.get(base_url + "?country=$country&apiKey=$apiKey");
  //       if (response.statusCode == 200) {
  //         updateListLoading(false);
  //         NewsModel newsModel = NewsModel.fromJson(response.data);
  //         articleModelList.addAll(newsModel.articles!);
  //       } else {
  //         updateListLoading(false);
  //         print("error");
  //       }
  //     } else {
  //       updateListLoading(false);
  //       noInternet = true;
  //       update();
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  getBooksApi(String queryParams) async {
    try {
      bookModelList.clear();

      ///https://newsapi.org/v2/top-headlines?country=us&apiKey=8780cdf148154a18b52efe8b1f666b58
      var noInternetConnectivity = await (Connectivity().checkConnectivity());
      if (noInternetConnectivity == ConnectivityResult.mobile ||
          noInternetConnectivity == ConnectivityResult.wifi) {
        updateListLoading(true);
        noInternet = false;
        update();
        var response = await client.get(
            "https://www.googleapis.com/books/v1/volumes?q=${queryParams}");
        if (response.statusCode == 200) {
          updateListLoading(false);
          BookModel bookModel = BookModel.fromJson(response.data);
          bookModelList.addAll(bookModel.items!);
        } else {
          updateListLoading(false);
          print("error");
        }
      } else {
        updateListLoading(false);
        noInternet = true;
        update();
      }
    } catch (e) {
      print(e.toString());
    }
  }}
