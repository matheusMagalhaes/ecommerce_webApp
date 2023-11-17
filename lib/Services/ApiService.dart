import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'http://localhost:8080/api/store-products/';

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

  Future<http.Response> post(String url, Map<String, dynamic> params) async {
    try {
      Uri uri = Uri.parse(_baseUrl + url);
      String? body;
      json.encode(body);

      http.Response res = await http.post(uri, headers: _headers, body: body);
      return res;
    } catch (e) {
      return http.Response({"message": e}.toString(), 400);
    }
  }

  Future<http.Response> put(String url, Map<String, dynamic> params) async {
    try {
      Uri uri = Uri.parse(_baseUrl + url);
      String? body;
      json.encode(body);

      http.Response res = await http.put(uri, headers: _headers, body: body);
      return res;
    } catch (e) {
      return http.Response({"message": e}.toString(), 400);
    }
  }
}
