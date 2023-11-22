import 'dart:convert';

import 'package:products_app/Models/Produtos.dart';
import 'package:products_app/Services/ApiService.dart';
import 'package:products_app/enums/enums.dart';
import 'package:http/http.dart' as http;

class ProdutoRepository {
  final ApiService _apiSevice = ApiService();

  Future<Map<String, dynamic>> getProductList(
      int page, String searchValue, SortTypes? sort) async {
    Map<String, String> params = {
      "page": page.toString(),
      "limit": PAGE_LIMIT.toString()
    };

    if (searchValue.isNotEmpty) {
      params["nomeProduto"] = searchValue;
      if (sort != null) {
        params["SortType"] = sort.toString().split('.').last;
      }
    }

    http.Response res = await this._apiSevice.get('findAll', params);
    dynamic responseJson = jsonDecode(res.body);
    final productData = responseJson['data']['content'] as List;
    List<Produtos> productList =
        productData.map((json) => Produtos.fromJson(json)).toList();
    final pageData = responseJson['data']['totalPages'];

    Map<String, dynamic> returnedData = {
      "products list": productList,
      "pages number": pageData
    };
    return returnedData;
  }

  Future<Produtos> addProduct(Produtos produto) async {
    http.Response res = await _apiSevice.post('add-new-product', produto);
    try {
      dynamic responseJson = json.decode(res.body);
      final jsonData = responseJson['data'];
      Produtos savedProduct = Produtos.fromJson(jsonData);
      return savedProduct;
    } catch (e) {
      throw new Exception(e);
    }
  }

  Future<Produtos> editProduct(Produtos produto) async {
    http.Response res =
        await _apiSevice.put('product-update', produto.toJson(produto));
    dynamic responseJson = jsonDecode(res.body);
    final jsonData = responseJson['data'];
    Produtos savedProduct = Produtos.fromJson(jsonData);

    return savedProduct;
  }
}
