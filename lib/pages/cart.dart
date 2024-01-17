import 'package:ecom_api/models/item_model.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier{
  final List<Product> items = [];

  double get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void addToCart(Product product) {
    items.add(product);
  }

  void removeFromCart(Product product) {
    items.remove(product);
  }
}
