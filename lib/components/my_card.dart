import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/providers/cart_list_provider.dart';
import 'package:shopping_cart/providers/favorite_list_provider.dart';

class MyCard extends StatelessWidget {
  final item;
  const MyCard({super.key, this.item});

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
            height: 100,
            width: 100,
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
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ],
          )),
          //----------- favourite or Cart -------------
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<FavouriteListProvider>(
                builder: (BuildContext context, FavouriteListProvider value, Widget? child) => Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: value.favoriteItems.contains(item) ? Colors.red : Colors.white,
                      border: Border.all(color: Colors.red),
                      shape: BoxShape.circle),
                  child: IconButton(
                    icon: Icon(Icons.favorite_border_rounded, color: value.favoriteItems.contains(item) ? Colors.white : Colors.red,),
                    onPressed: () {
                      if(value.favoriteItems.contains(item)){
                        value..removeFromFavorite(item);
                      }else{
                        value.addToFavorite(item);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<CartListProvider>(
                builder: (BuildContext context, CartListProvider value,
                        Widget? child) =>
                    Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: value.cartItems.contains(item) ? Colors.black : Colors.white,
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle),
                  child: IconButton(
                    icon:  Icon(
                      Icons.shopping_cart,
                      color: value.cartItems.contains(item) ? Colors.white : Colors.black,
                    ),
                    onPressed: () {
                      if(value.cartItems.contains(item)){
                        value.removeFromCart(item);
                      }else{
                        value.addToCart(item);
                      }
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
