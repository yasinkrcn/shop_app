
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/feature/riverpod/riverpod_management.dart';
import 'package:shop_app/feature/widgets/product_widget.dart';


class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(productRiverpod);
    var read = ref.read(productRiverpod);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.asset(AssetsPath().iphoneJPG,height: 200,),
          const Center(
              child: Text(
            'Ürünler',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 588,
            width: 500,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: read.products.length,
              itemBuilder: (context, index) {
                return ProductWidget(
                    model: watch.products[index],
                    setFavorite: () => read.setFavorite(watch.products[index]),
                    setBasket: () =>read.addedBasket(watch.products[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
