import 'package:flutter/material.dart';

class CartListProvider extends ChangeNotifier {
  List<Map<String, dynamic>> cartItems = [];

  void addToCart(var item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(var item) {
    cartItems.remove(item);
    notifyListeners();
  }

  double calculateTotal() {
    return cartItems.fold(
      0.0,
      (totalPrice, item) => totalPrice + item["price"],
    );
  }
}
