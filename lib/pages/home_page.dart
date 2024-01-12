import 'package:flutter/material.dart';
import 'package:shopping_cart/components/my_card.dart';
import 'package:shopping_cart/const/items.dart';
import 'package:shopping_cart/pages/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shopping"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    var item = items[index];
                    return MyCard(
                      item: item,
                    );
                  })),
        ],
      ),
    );
  }
}
