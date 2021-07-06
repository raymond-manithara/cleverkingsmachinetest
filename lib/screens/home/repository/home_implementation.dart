import 'package:architecture_latest/common/constants/api_constants.dart';
import 'package:architecture_latest/helpers/http/http.dart';
import 'package:architecture_latest/screens/home/model/country_dto.dart';
import 'package:architecture_latest/screens/home/repository/home_repository.dart';

class HomeImplementation extends HomeRepository {
  Future<List<CountryDTO>> renderData() async {
    var _response = await Http().getRequest(countryApiEndpoint);
    return _response
        .map<CountryDTO>((_entry) => CountryDTO.fromJson(_entry))
        .toList();
  }
}
