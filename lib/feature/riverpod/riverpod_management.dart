

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/feature/riverpod/bottom_nav_bar_riverpod.dart';
import 'package:shop_app/feature/riverpod/product_riverpod.dart';

final bottomNavBarRiverpod = ChangeNotifierProvider((_)=> BottomNavBarRiverpod());
final productRiverpod = ChangeNotifierProvider((_)=> ProductRiverpod());



