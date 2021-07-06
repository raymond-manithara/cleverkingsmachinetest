import 'package:architecture_latest/screens/Home/repository/Home_implementation.dart';
import 'package:architecture_latest/screens/countries/country_view_model.dart';
import 'package:architecture_latest/screens/home/home_view_model.dart';
import 'package:architecture_latest/screens/home/repository/home_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initiateInjection() {
  /// Home
  getIt.registerSingleton<HomeRepository>(HomeImplementation());
  getIt.registerFactory(() => HomeViewModel(getIt()));

  /// Country
  getIt.registerFactory(() => CountryViewModel());
}
