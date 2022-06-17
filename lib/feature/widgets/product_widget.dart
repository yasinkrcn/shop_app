import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/feature/model/product_model.dart';

class ProductWidget extends StatelessWidget {
  ProductModel model;
  Function setFavorite;
  Function setBasket;

  ProductWidget({required this.model,required this.setFavorite,required this.setBasket,});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.blue.shade200, blurRadius: 8)
            ]),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                      model.imagePath),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        model.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${model.price} TL',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        model.description,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black),
                        onPressed: ()=> setBasket(),
                        icon: const Icon(
                            CupertinoIcons.bag_badge_plus),
                        label: Text('Ekle'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: (() => setFavorite()),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.red, blurRadius: 4)
                    ],
                  ),
                  child: Icon(model.isFavorite
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                      color: model.isFavorite?
                      Colors.red:
                      Colors.black
                      
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}