import 'package:get_it/get_it.dart';
import 'package:housing/Pages/contact/phonecall.dart';
import 'package:housing/Pages/maplaunch/maplauncher.dart';

final getitlocator = GetIt.instance;


void setup(){
  getitlocator.registerLazySingleton<MapLauncher>(() => MapLauncher());
  getitlocator.registerLazySingleton(() => PhoneCall());
}