import 'package:get/get.dart';
import 'package:news_app/News/Screens/application/bindings/news_page_binding.dart';
import 'package:news_app/News/Screens/ui_screens/news_page.dart';
import 'package:news_app/Pages/pages.dart';
import 'package:news_app/book/application/binding/BookBinding.dart';
import 'package:news_app/book/ui/book_ui.dart';

part 'app_routes.dart';



class AppPages {
  static const initial = Routes.defaultRoute;

  static final routes = [
    GetPage(name: Routes.defaultRoute,page: () => const Home()),
     GetPage(name: Routes.home,  page: () => const Home()),
     GetPage(
        name: Routes.newsSummary,
        binding: NewsPageBinding(),
        page: () => const NewsPage()),
    GetPage(name: Routes.newsSummary, page: () => const NewsDetails()),
    GetPage(
        name: Routes.bookSummary,
        binding: BookBinding(),
        page: () => const BookPage()),

  ];
}
