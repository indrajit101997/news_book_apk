import 'package:get/get.dart';
import 'package:news_app/book/application/controller/BookController.dart';

class BookBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BookController>(BookController());
  }
}