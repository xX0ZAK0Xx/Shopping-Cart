import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/components/my_card.dart';
import 'package:shopping_cart/components/small_card.dart';
import 'package:shopping_cart/providers/cart_list_provider.dart';
import 'package:shopping_cart/providers/favorite_list_provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite items"),
      ),
      body: Consumer<FavouriteListProvider>(
        builder:
            (BuildContext context, FavouriteListProvider value, Widget? child) =>
                Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //---------- items --------

            Expanded(
                child: ListView.builder(
                    itemCount: value.favoriteItems.length,
                    itemBuilder: (context, index) {
                      return MyCard(
                        item: value.favoriteItems[index],
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
