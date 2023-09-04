import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required Product this.product});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
