import 'package:exammm3/model/sql_product_model.dart';
import 'package:flutter/material.dart';


class CartItemView extends StatelessWidget {
  const CartItemView(
      {Key? key, required this.cachedProduct, required this.onItemTap})
      : super(key: key);

  final SqlSelectedProduct cachedProduct;
  final VoidCallback onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cachedProduct.name),
      subtitle: Text(
        "Mahsulotlar soni:  ${cachedProduct.count} x ${cachedProduct.price}",
        style: TextStyle(color: Color(0xff4047C1)),
      ),
      trailing: SizedBox(
        width: 115,
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(cachedProduct.imageUrl),
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: onItemTap,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
