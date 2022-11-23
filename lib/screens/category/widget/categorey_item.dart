import 'package:exammm3/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryIK extends StatelessWidget {
  const CategoryIK(
      {Key? key, required this.categoryItem, required this.onTap})
      : super(key: key);

  final VoidCallback onTap;

  final Cat_model categoryItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: 8,
                blurRadius: 5,
                offset: const Offset(1, 3),
                color: Colors.grey.shade300,
              )
            ]),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              height: 100,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16)),
                child: Image.network(categoryItem.imageUrl),
              ),
            ),
            Expanded(
              child: Text(
                categoryItem.name,
                textAlign: TextAlign.center,
                style:const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
