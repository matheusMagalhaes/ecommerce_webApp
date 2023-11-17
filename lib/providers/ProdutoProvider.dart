import 'package:flutter/cupertino.dart';
import 'package:products_app/Models/Produtos.dart';
import 'package:products_app/enums/enums.dart';
import 'package:products_app/repositories/ProdutoRepository.dart';

class ProductProvider extends ChangeNotifier {
  List<Produtos> products = [];
  Produtos? productToEdit;
  int pagesNumber = 0;

  final ProdutoRepository _productRepository = ProdutoRepository();

  getProducts(int page, String searchValue, SortTypes? sortType,
      GetTypes getTypes) async {
    Map<String, dynamic> returnedData =
        await _productRepository.getProductList(page, searchValue, sortType);
    List<Produtos> pageProducts = returnedData["products list"];
    pagesNumber = returnedData["pages number"];
    if (getTypes == GetTypes.PAGING) {
      products = products + pageProducts;
    } else if (getTypes == GetTypes.FILTER) {
      products = pageProducts;
    }
    notifyListeners();
  }

  addProduct(Produtos product) async {
    Produtos savedProduct = await _productRepository.addProduct(product);
    products.add(savedProduct);
    notifyListeners();
  }

  editProduct(Produtos product) async {
    Produtos editedProduct = await _productRepository.editProduct(product);
    products[products.indexOf(product)] = editedProduct;
    notifyListeners();
  }
}
