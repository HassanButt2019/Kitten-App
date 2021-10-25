import 'package:dartz/dartz.dart';
import 'package:http/http.dart'as http;


class CatPhotoApi
{
  String endPoint = "api.thecatapi.com";
final parameters = {
  "api_key":"346d03d0-db17-432c-841d-39bc8a991957"
};
  Future<Either<Exception,String>> getRandomCatPhotos() async
  {
    try
    {
      final uri = Uri.https(endPoint,"/v1/images/search" , parameters );
      final response = await http.get(uri);
      return Right(response.body);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}

