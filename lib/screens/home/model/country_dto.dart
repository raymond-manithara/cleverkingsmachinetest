class CountryDTO {
  final String? name;
  final String? capital;
  final String? region;
  final String? flag;
  CountryDTO({this.capital, this.flag, this.name, this.region});
  CountryDTO.fromJson(Map _payload)
      : name = _payload["name"],
        capital = _payload["capital"],
        flag = _payload["flag"],
        region = _payload["region"];
}
