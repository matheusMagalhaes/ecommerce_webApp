import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:products_app/Models/Produtos.dart';
import 'package:products_app/Views/screens/Widgets/ElevButton.dart';
import 'package:provider/provider.dart';

import '../../../providers/ProdutoProvider.dart';

class AddProductDrawer extends StatefulWidget {
  const AddProductDrawer({Key? key}) : super(key: key);

  @override
  State<AddProductDrawer> createState() => _AddProductDrawerState();
}

class _AddProductDrawerState extends State<AddProductDrawer> {
  late final Produtos _newProduct = Produtos.empty();
  Produtos? _editProduct;
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _editProduct =
          Provider.of<ProductProvider>(context, listen: false).productToEdit;
      if (_editProduct != null) {
        nameController = TextEditingController(text: _editProduct!.nome);
        descController = TextEditingController(text: _editProduct!.descricao);
        imageController = TextEditingController(text: _editProduct!.imagem);
        priceController =
            TextEditingController(text: _editProduct!.preco.toString());
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            Text(
              _editProduct == null ? 'Add Product' : 'Edit Product',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
              onChanged: (value) {
                if (_editProduct == null) {
                  _newProduct.nome = value;
                } else {
                  _editProduct!.nome = value;
                }
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
              onChanged: (value) {
                if (_editProduct == null) {
                  _newProduct.descricao = value;
                } else {
                  _editProduct!.descricao = value;
                }
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: imageController,
              decoration: const InputDecoration(labelText: 'Image Link'),
              onChanged: (value) {
                if (_editProduct == null) {
                  _newProduct.imagem = value;
                } else {
                  _editProduct!.imagem = value;
                }
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Price \$'),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (_editProduct == null) {
                  _newProduct.preco = double.parse(value);
                } else {
                  _editProduct!.preco = double.parse(value);
                }
              },
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevButton(
                    text: _editProduct == null ? 'Save' : 'Edit',
                    icon: _editProduct == null ? Icons.save : Icons.edit,
                    onPressed: () {
                      if (_editProduct == null) {
                        Provider.of<ProductProvider>(context, listen: false)
                            .addProduct(_newProduct);
                      } else {
                        Provider.of<ProductProvider>(context, listen: false)
                            .editProduct(_editProduct!);
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
