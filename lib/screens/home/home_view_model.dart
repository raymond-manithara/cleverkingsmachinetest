import 'package:architecture_latest/screens/home/model/country_dto.dart';
import 'package:architecture_latest/screens/home/repository/home_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  final HomeRepository _repository;
  HomeViewModel(HomeRepository repository) : _repository = repository;

  List<String?>? regions;
  List<CountryDTO>? countries;
  bool isLoading = true;

  downloadDataFromAPI() async {
    setLoading(true);
    countries = await _repository.renderData();
    regions = countries
        ?.map<String?>((CountryDTO _entry) => _entry.region)
        .toSet()
        .toList();
    setLoading(false);
  }

  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  List<CountryDTO>? filterListWithRegion(String? _region) {
    return countries
        ?.where((CountryDTO _entry) => _entry.region == _region)
        .toList();
  }
}
