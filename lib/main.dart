import 'package:flutter/material.dart';
import 'package:kittenstore/Utils/getIt.dart';
import 'package:kittenstore/view/CatPhotoView/CatPhotoScreen.dart';

void main() {
  runApp(MyApp());
  setup();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CatPhotoView(),
    );
  }
}

