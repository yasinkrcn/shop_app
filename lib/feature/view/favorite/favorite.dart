import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/feature/riverpod/riverpod_management.dart';
import 'package:shop_app/feature/widgets/product_widget.dart';

class Favorite extends ConsumerWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var favorite = ref.watch(productRiverpod);
    var product = ref.watch(productRiverpod);
    return Scaffold(
      body: product.favorites.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Favori ürününüz bulunmamaktadır.'),
                  OutlinedButton(
                    onPressed: () =>
                        ref.watch(bottomNavBarRiverpod).setCurrentIndex(0),
                    child: Text('Ürünlere git'),
                  ),
                ],
              ),
            )
          : Column(
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
                    itemCount: product.favorites.length,
                    itemBuilder: (context, index) {
                      return ProductWidget(
                          model: product.favorites[index],
                          setFavorite: () => product.setFavorite(product.favorites[index]),
                          setBasket: () =>product.addedBasket(product.favorites[index]));
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
