import 'dart:convert';
import 'package:ecom_api/models/item_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

// Future<List<Product>>, our function returns in the future, a list
// and each elemnt is of type Product
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).cast<Product>().toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
