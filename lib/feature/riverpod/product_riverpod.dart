import 'package:flutter/cupertino.dart';
import 'package:shop_app/constants/asseth_path.dart';
import 'package:shop_app/feature/model/product_model.dart';

class ProductRiverpod extends ChangeNotifier {


  double totalPrice = 0.0;
  List<ProductModel> favorites = [];
  List<ProductModel> basketProducts = [];
  List<ProductModel> products = [
    ProductModel(
        isFavorite: false,
        imagePath: AssetsPath().iphonePNG,
        title: 'Iphone 13',
        price: 30000,
        description: 'description'),
    ProductModel(
        isFavorite: false,
        imagePath: AssetsPath().s22UltraPNG,
        title: 'S22 Ultra',
        price: 25000,
        description: 'description'),
    ProductModel(
        isFavorite: false,
        imagePath: AssetsPath().samsungA53PNG,
        title: 'A53',
        price: 12000,
        description: 'description'),
    ProductModel(
        isFavorite: false,
        imagePath: AssetsPath().xiaomi12UltraPNG,
        title: 'Xiaomi 12 Ultra',
        price: 23000,
        description: 'description'),
    ProductModel(
        isFavorite: false,
        imagePath: AssetsPath().redmiNote11PNG,
        title: 'Redmi Note 11',
        price: 7500,
        description: 'description'),
  ];

  void setFavorite(ProductModel model) {
    if (model.isFavorite) {
      model.isFavorite = false;
      favorites.remove(model);
      notifyListeners();
    } else {
       model.isFavorite = true;
      favorites.add(model);
      notifyListeners();
    }
  }

  void setTotalPrice(ProductModel model){
    totalPrice += model.price;
  }

  void addedBasket(ProductModel model){
    basketProducts.add(model);
    setTotalPrice(model);
  }


 
}
