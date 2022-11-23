import 'package:exammm3/screens/category/widget/categorey_item.dart';
import 'package:exammm3/model/category_model.dart';
import 'package:exammm3/screens/constant.dart';
import 'package:exammm3/myreP.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.myRepository})
      : super(key: key);

  final MyRepository myRepository;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategoryalar ro'yxati"),
      ),
      body: FutureBuilder<List<Cat_model>>(
        future: widget.myRepository.getAllCategories(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Cat_model>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            List<Cat_model> data = snapshot.data!;
            return ListView(
              children: List.generate(data.length, (index) {
                return CategoryIK(
                  categoryItem: data[index],
                  onTap: () {
                    Navigator.pushNamed(
                        context, categoriesProductsRoute, arguments: [widget.myRepository, data[index],
                    ],
                    );
                  },
                );
              },
              ),
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
}
