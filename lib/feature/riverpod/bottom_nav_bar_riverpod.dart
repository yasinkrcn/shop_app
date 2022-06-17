import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/feature/view/basket/basket.dart';
import 'package:shop_app/feature/view/favorite/favorite.dart';
import 'package:shop_app/feature/view/home/home.dart';

class BottomNavBarRiverpod extends ChangeNotifier {
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: 'Ana Sayfa',
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.heart), label: 'Favoriler'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag), label: 'Sepet'),
  ];

  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;

    notifyListeners();
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return Home();

      case 1:
        return Favorite();

      case 2:
        return Basket();

      default:
        return Home();
    }
  }

  String appBarTitle() {
    switch (currentIndex) {
      case 0:
        return 'AnaSayfa';

      case 1:
        return 'Favoriler';

      case 2:
        return 'Sepet';

      default:
        return 'Ana Sayfa';
    }
  }
}
