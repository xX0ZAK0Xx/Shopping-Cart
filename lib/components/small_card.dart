import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/providers/cart_list_provider.dart';

class SmallCard extends StatelessWidget {
  final item;
  const SmallCard({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.only(top: 12.5, right: 25, left: 25, bottom: 12.5),
      padding: const EdgeInsets.all(15),
      // height: 120,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset:
                const Offset(0, 3), // Adjust offset to change shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          //---------- Image ----------
          SizedBox(
            height: 50,
            width: 50,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(item["imageUrl"]),
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //---------- Name ----------
              Text(
                item["name"],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              //---------- Price ----------
              Text(
                "\$${item["price"].toString()}",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
            ],
          )),
          //----------- Remove from Cart -------------
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<CartListProvider>(
                builder: (BuildContext context, CartListProvider value,
                        Widget? child) =>
                    Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle),
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
