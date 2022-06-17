import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/feature/riverpod/riverpod_management.dart';
import 'package:shop_app/feature/widgets/bottom_nav_bar.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  const BaseScaffold({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold> {

  @override
  void initState() {
    ref.read(productRiverpod).products;
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(bottomNavBarRiverpod);
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: CupertinoNavigationBar(
         middle: Text(watch.appBarTitle())
      ),
      body: watch.body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}