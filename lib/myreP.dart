

import 'package:exammm3/localdata.dart';
import 'package:exammm3/model/category_model.dart';
import 'package:exammm3/model/product_model.dart';
import 'package:exammm3/model/sql_product_model.dart';
import 'package:exammm3/service.dart';

class MyRepository {
  MyRepository({
    required this.apiProvider,
  });

  final MyApi apiProvider;

  Future<List<Prod_model>> getAllProducts() => apiProvider.getAllPpro();

  Future<List<Prod_model>> getAllCCatProducts({required int id}) =>
      apiProvider.getCProductsC(id: id);

  Future<List<Cat_model>> getAllCategories() =>
      apiProvider.getAllCC();

  Future<SqlSelectedProduct> insertCCProduct(
      {required SqlSelectedProduct cachedProduct}) async {
    return await LocalDatabase.insertProduct(cachedProduct);
  }

  Future<List<SqlSelectedProduct>> getAllCaceDProducts() async {
    return await LocalDatabase.getAllProducts();
  }

  Future<int> deleteCachedProductById({required int id}) async {
    return await LocalDatabase.deleteProductById(id);
  }

  Future<int> updateCProductByIdCI(
      {required int id, required SqlSelectedProduct cachedProduct}) async {
    return await LocalDatabase.updateProduct(
        id: id, cachedProduct: cachedProduct);
  }

  Future<int> updateCProductCT({required int id, required int count}) async {
    return await LocalDatabase.updateProductCount(id: id, count: count);
  }

  Future<int> CLAllCachedProductsEr() async {
    return await LocalDatabase.deleteAllProducts();
  }
}