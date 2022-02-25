import 'package:get/get.dart';
import 'package:news_app/News/Screens/application/controller/news_page_controller.dart';


class NewsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsPageController());
  }
}