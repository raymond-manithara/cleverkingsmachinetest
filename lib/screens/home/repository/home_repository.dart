import 'package:architecture_latest/screens/home/model/country_dto.dart';

abstract class HomeRepository {
  Future<List<CountryDTO>> renderData();
}
