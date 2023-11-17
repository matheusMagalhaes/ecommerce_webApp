import 'package:products_app/Services/ApiService.dart';
import 'package:products_app/enums/enums.dart';

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
  }
}
