import 'dart:convert';
import 'package:exammm3/model/category_model.dart';
import 'package:exammm3/model/product_model.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class MyApi {
  Future<List<Prod_model>> getAllPpro() async {
    try {
      Response response = await https.get(Uri.parse("https://third-exam.free.mockoapp.net/products"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<Prod_model> products = (jsonData as List?)
                ?.map((item) => Prod_model.fromJson(item))
                .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Cat_model>> getAllCC() async {
    try {
      Response response = await https.get(Uri.parse("https://third-exam.free.mockoapp.net/categories"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var categories = (jsonData as List?)
                ?.map((element) => Cat_model.fromJson(element))
                .toList() ??
            [];
        return categories;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Prod_model>> getCProductsC({required int id}) async {
    try {
      Response response = await https.get(Uri.parse("https://third-exam.free.mockoapp.net/categories/$id"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var products = (jsonData as List?)
                ?.map((element) => Prod_model.fromJson(element))
                .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
