


import 'dart:convert';

import 'package:kittenstore/model/core/CatPhoto.dart';
import 'package:kittenstore/model/glitch/Glitch.dart';
import 'package:kittenstore/model/services/CatPhotoService.dart';
import 'package:dartz/dartz.dart';


class CatPhotoHelper
{
  final api = CatPhotoApi();

  Future<Either<Glitch,CatPhoto>> getRandomPhotos () async
  {
    final apiResult = await api.getRandomCatPhotos();

    return apiResult.fold((l){

      return Left(NoInternetGlitch());
    },(r){
      final photo = CatPhoto.fromMap(jsonDecode(r)[0]);
      return Right(photo);
    });
  }
}