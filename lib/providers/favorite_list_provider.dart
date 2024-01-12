import 'package:flutter/material.dart';

class FavouriteListProvider extends ChangeNotifier {
  List<Map<String, dynamic>> favoriteItems = [];

  void addToFavorite(var item) {
    favoriteItems.add(item);
    notifyListeners();
  }

  void removeFromFavorite(var item) {
    favoriteItems.remove(item);
    notifyListeners();
  }
}
