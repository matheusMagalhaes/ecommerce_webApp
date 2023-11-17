import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:products_app/Models/Produtos.dart';

class ProductContainer extends StatelessWidget {
  final Produtos product;
  const ProductContainer({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 210,
          width: 300,
          child: ClipRRect(
            child: Image.network(
              product.imagem!,
              fit: BoxFit.cover,
              cacheHeight: 300,
              cacheWidth: 300,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          product.nome!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          product.preco.toString() + " \$",
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
