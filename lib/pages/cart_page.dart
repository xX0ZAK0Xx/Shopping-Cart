import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/providers/cart_list_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Added items"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //---------- items --------
          Consumer<CartListProvider>(
            builder:
                (BuildContext context, CartListProvider value, Widget? child) =>
                    Expanded(
                        child: ListView.builder(
                            itemCount: value.cartItems.length,
                            itemBuilder: (context, index) {
                              return Text(value.cartItems[index]["name"]);
                            })),
          ),

          //---------- Total price --------
          Text("Total price"),
        ],
      ),
    );
  }
}
