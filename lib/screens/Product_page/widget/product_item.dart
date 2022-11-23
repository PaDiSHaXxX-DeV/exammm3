import 'package:exammm3/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductsIVi extends StatelessWidget {
  const ProductsIVi(
      {Key? key,
        required this.item,
        required this.onTap,
      })
      : super(key: key);

  final Prod_model item;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.grey),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 8,
                    blurRadius: 5,
                    offset: const Offset(1, 3),
                    color: Colors.grey.shade300)
              ]),
          child: Column(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),

              Text(
                "USD ${item.price}",
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF4047C1),
                ),
              ),
              TextButton(
                onPressed: onTap,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  "Savatga qo'shish",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
