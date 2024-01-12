import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/components/small_card.dart';
import 'package:shopping_cart/providers/cart_list_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Added items"),
      ),
      body:Consumer<CartListProvider>(
            builder:
                (BuildContext context, CartListProvider value, Widget? child) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //---------- items --------
          
                    Expanded(
                        child: ListView.builder(
                            itemCount: value.cartItems.length,
                            itemBuilder: (context, index) {
                              return SmallCard(item: value.cartItems[index],);
                            })),

          //---------- Total price --------
          Container(height: 2, color: Colors.black,margin: EdgeInsets.symmetric(horizontal: 25),),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total price:", style: TextStyle(fontSize: 30),),
                Text( value.calculateTotal().toStringAsFixed(2), style: TextStyle(fontSize: 30),),
              ],
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
          ),
    );
  }
}
