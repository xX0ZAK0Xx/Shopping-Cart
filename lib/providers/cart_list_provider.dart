import 'package:flutter/material.dart';

class CartListProvider extends ChangeNotifier {
  List<Map<String, dynamic>> cartItems = [];

  void addToCart(var item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(var item) {
    item["quantity"] = 1;
    cartItems.remove(item);
    notifyListeners();
  }

  void increment(var item) {
    item["quantity"]++;
    notifyListeners();
  }
  void decrement(var item) {
    if(item["quantity"] > 1){
      item["quantity"]--;
      notifyListeners();
    }
  }

  double calculateTotal() {
    return cartItems.fold(
      0.0,
      (totalPrice, item) => totalPrice + (item["price"] * item["quantity"]!),
    );
  }
}
