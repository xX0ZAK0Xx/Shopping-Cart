import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/providers/cart_list_provider.dart';

class SmallCard extends StatelessWidget {
  final item;
  const SmallCard({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 25),
      padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(item["imageUrl"]),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["name"],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  "\$${item["price"].toString()}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          Consumer<CartListProvider>(
            builder:
                (BuildContext context, CartListProvider value, Widget? child) =>
                    Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40, // Set width to match height for circular shape
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.remove_shopping_cart_rounded,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      value.removeFromCart(item);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround, // Center the row
                  children: [
                    // Decrement button
                    IconButton(
                        onPressed: () {
                          value.decrement(item);
                        },
                        icon: Icon(Icons.remove)),
                    //Quantity
                    Text(item["quantity"].toString()),
                    // Increment button
                    IconButton(
                        onPressed: () {
                          value.increment(item);
                        },
                        icon: Icon(Icons.add)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
