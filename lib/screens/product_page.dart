import 'package:exammm3/screens/product_item.dart';
import 'package:exammm3/model/category_model.dart';
import 'package:exammm3/model/product_model.dart';
import 'package:exammm3/model/sql_product_model.dart';
import 'package:exammm3/myreP.dart';
import 'package:flutter/material.dart';
class CategoryProScreen extends StatefulWidget {
  const CategoryProScreen({
    Key? key,
    required this.myRepository,
    required this.category,
  }) : super(key: key);

  final MyRepository myRepository;
  final Cat_model category;

  @override
  State<CategoryProScreen> createState() => _CategoryProScreenState();
}

class _CategoryProScreenState extends State<CategoryProScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: FutureBuilder<dynamic>(
        future: Future.wait(
            [widget.myRepository.getAllCCatProducts(id: widget.category.id)]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            List<Prod_model> data = snapshot.data[0]! as List<Prod_model>;
            return GridView.count(
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 0.6,
              children: List.generate(data.length, (index) {
                var item = data[index];
                return ProductsIVi(
                  item: item,
                  onTap: () => addToBasket(item),
                );
              }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<void> addToBasket(Prod_model item) async {
    int count = 0;
    List<SqlSelectedProduct> savedProducts = await widget.myRepository.getAllCaceDProducts();
    bool beforeSaved = false;
    int savedId = 0;
    for (var element in savedProducts) {
      if (element.productId == item.id) {
        beforeSaved = true;
        savedId = element.id!;
        count = element.count;
      }
    }
    if (beforeSaved) {
      count += 1;
      await widget.myRepository.updateCProductByIdCI(
        id: savedId,
        cachedProduct: SqlSelectedProduct(
          imageUrl: item.imageUrl,
          price: item.price,
          count: count,
          name: item.name,
          productId: item.id,
        ),
      );
    } else {
      widget.myRepository.insertCCProduct(
        cachedProduct: SqlSelectedProduct(
          imageUrl: item.imageUrl,
          price: item.price,
          count: 1,
          name: item.name,
          productId: item.id,
        ),
      );
    }
    final snackBar = SnackBar(
      content: const Text("Mahsulot savtga muvaffaqiyatli qo'shildi"),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}


