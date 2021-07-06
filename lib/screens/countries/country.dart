import 'package:architecture_latest/common/registry/injection_registry.dart';
import 'package:architecture_latest/screens/countries/country_view_model.dart';
import 'package:architecture_latest/screens/countries/widgets/main_widget.dart';
import 'package:architecture_latest/screens/home/model/country_dto.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Country extends StatefulWidget {
  final List<CountryDTO>? countries;
  const Country({this.countries, Key? key}) : super(key: key);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  late CountryViewModel _viewModel;
  @override
  void initState() {
    _viewModel = getIt.get<CountryViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _viewModel,
      child: Material(
        child: Center(
          child: CountryMainWidget(
            countries: widget.countries,
          ),
        ),
      ),
    );
  }
}
