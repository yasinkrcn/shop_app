import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/feature/view/base_scaffold/base_scaffold.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ProviderScope(child: ((MyApp()))));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BaseScaffold(),
    );
  }
}
