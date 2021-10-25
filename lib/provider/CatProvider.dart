


import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:kittenstore/model/core/CatPhoto.dart';
import 'package:kittenstore/model/glitch/Glitch.dart';
import 'package:kittenstore/model/helper/CatPhotoHelper.dart';

class CatProvider extends ChangeNotifier
{
  final _helper = CatPhotoHelper();

  final _streamController = StreamController<Either<Glitch,CatPhoto>>();
   

  Stream<Either<Glitch,CatPhoto>> get catPhotoStream {
    return _streamController.stream;
  }
  void refreshGird() {
  getTwentyRandomPhoto();
}

  Future<void> getTwentyRandomPhoto()async 
  {
    for (int i = 1 ; i < 40 ; i++)
    {
      final catHelper = await _helper.getRandomPhotos();
      _streamController.add(catHelper);
    }
  }
}