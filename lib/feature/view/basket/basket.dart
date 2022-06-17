
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/feature/riverpod/riverpod_management.dart';
import 'package:shop_app/feature/widgets/product_widget.dart';

class Basket extends ConsumerWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var product = ref.watch(productRiverpod);
    return product.basketProducts.length == 0
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sepetiniz boş.'),
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
                height: 400,
                width: 500,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: product.basketProducts.length,
                  itemBuilder: (context, index) {
                    return ProductWidget(
                        model: product.basketProducts[index],
                        setFavorite: () =>
                            product.setFavorite(product.basketProducts[index]),
                        setBasket: () {});
                  },
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Toplam tutar: ${product.totalPrice} TL'),
                  OutlinedButton(onPressed: () {}, child: Text('Sipariş ver'))
                ],
              )
            ],
          );
  }
}
