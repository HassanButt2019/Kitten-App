

import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kittenstore/Utils/constants.dart';
import 'package:kittenstore/Utils/getIt.dart';
import 'package:kittenstore/model/core/CatPhoto.dart';
import 'package:kittenstore/model/glitch/Glitch.dart';
import 'package:kittenstore/provider/CatProvider.dart';
import 'package:kittenstore/view/CatPhotoView/Components/CatPhotoErrorTile.dart';
import 'package:kittenstore/view/CatPhotoView/Components/CatPhotoTile.dart';

class CatPhotoView extends StatefulWidget {
  const CatPhotoView({ Key? key }) : super(key: key);

  @override
  _CatPhotoViewState createState() => _CatPhotoViewState();
}

class _CatPhotoViewState extends State<CatPhotoView> with AfterLayoutMixin {
  var catPhotos = []; 
  var catPhotosTiles = [];
   final provider = getIt<CatProvider>();

  @override
  void afterFirstLayout(BuildContext context) {
    print("HELLOW ORLD");


    // TODO: implement afterFirstLayout
  provider.getTwentyRandomPhoto();

  provider.catPhotoStream.listen((event) {
    event.fold((l) {
      if(l is NoInternetGlitch)
      {
                  Color randomColor = Color.fromRGBO(
            Random().nextInt(255),
            Random().nextInt(255),
            Random().nextInt(255),
            1
          );
          catPhotos.add(CatPhotoErrorTile(randomColor, "Unable to Connect"));

      }
    }, (r) =>{
       catPhotos.add(CatPhotoTile(r.url!)),
    });

          int count = Random().nextInt(4);
      catPhotosTiles.add(StaggeredTile.count(count, count.toDouble()));

      setState(() {});
  });
  
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh , color: Colors.black,),
              onPressed: () {
                catPhotosTiles.clear();
                catPhotos.clear();
                provider.refreshGird();
              },
            )
          ],
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Cute kitten',
            style: TextStyle(color: Colors.black),
            // style: GoogleFonts.pacifico(),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: catPhotos.length == 0
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    staggeredTileBuilder: (index) => catPhotosTiles[index],
                    itemCount: catPhotos.length,
                    itemBuilder: (context, index) {
                    //  print(catPhotos[index]);
                      return catPhotos[index];
                    })));
  }








}