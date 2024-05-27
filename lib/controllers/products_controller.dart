import 'dart:convert';

import 'package:lesson44/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsController {
  final List<Product> _list = [];

  List<Product> get list {
    return [..._list];
  }

  Future<void> getProducts() async {
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    try {
      final response = await http.get(url);
      List<Map<String, dynamic>> data =
          jsonDecode(response.body).cast<Map<String, dynamic>>();
      for (var product in data) {
        _list.add(Product.fromJson(product));
      }
    } catch (e) {
      print(e);
    }
  }
}
