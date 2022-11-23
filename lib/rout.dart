import 'package:exammm3/screens/Nav_Bar/navigation_bar.dart';
import 'package:exammm3/screens/Product_page/product_page.dart';
import 'package:exammm3/model/category_model.dart';
import 'package:exammm3/screens/constant.dart';
import 'package:exammm3/myreP.dart';
import 'package:flutter/material.dart';



class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case tabsRoute:
        return MaterialPageRoute(
          builder: (_) => NavBar(),
        );
      case categoriesProductsRoute:
        return MaterialPageRoute(builder: (_) {
          var list = settings.arguments as List<dynamic>;
          MyRepository myRepository = list[0];
          Cat_model categoryItem = list[1];
          return CategoryProScreen(
            myRepository: myRepository,
            category: categoryItem,
          );
        });
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}