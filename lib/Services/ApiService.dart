import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:products_app/Models/Produtos.dart';

class ApiService {
  final String _baseUrl = 'http://10.0.2.2:8080/api/store-products/';

  final Map<String, String> _headers = {
    "content-type": "application/json",
    "accept": "application/json"
  };

  Future<http.Response> get(String url, Map<String, String> params) async {
    try {
      Uri uri = Uri.parse(_baseUrl + url).replace(queryParameters: params);
      http.Response res = await http.get(uri);
      return res;
    } catch (e) {
      return http.Response({"message": e}.toString(), 400);
    }
  }

  Future<http.Response> post(String url, Produtos body) async {
    try {
      Uri uri = Uri.parse(_baseUrl + url);
      dynamic prd = json.encode(body.toJson(body));

      http.Response res = await http.post(uri, headers: _headers, body: prd);
      return res;
    } catch (e) {
      throw new Exception(e);
    }
  }

  Future<http.Response> put(String url, Map<String, dynamic> body) async {
    try {
      Uri uri = Uri.parse(_baseUrl + url);
      String? stringBody = json.encode(body);

      http.Response res =
          await http.put(uri, headers: _headers, body: stringBody);
      return res;
    } catch (e) {
      return http.Response({"message": e}.toString(), 400);
    }
  }
}
