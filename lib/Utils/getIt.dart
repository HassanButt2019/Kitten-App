import 'package:get_it/get_it.dart';
import 'package:kittenstore/provider/CatProvider.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<CatProvider>(CatProvider());
}