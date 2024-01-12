import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/const/items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shopping"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    var item = items[index];
                    return Container(
                      margin: const EdgeInsets.only(top: 12.5, right: 25, left: 25, bottom: 12.5),
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
                            offset: const Offset(0,
                                3), // Adjust offset to change shadow position
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(item["imageUrl"]),
                                )),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //---------- Name ----------
                              Text(
                                item["name"],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              //---------- Price ----------
                              Text(
                                "\$${item["price"].toString()}",
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w900),
                              ),
                            ],
                          )),
                          //----------- favourite or Cart -------------
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black),
                                  shape: BoxShape.circle),
                                child: IconButton(icon: const Icon(Icons.shopping_cart,), onPressed: () {},
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black),
                                  shape: BoxShape.circle),
                                child: IconButton(icon: const Icon(Icons.favorite_outline), onPressed: () {},
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
