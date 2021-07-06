import 'package:architecture_latest/screens/home/model/country_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryMainWidget extends StatefulWidget {
  final List<CountryDTO>? countries;
  const CountryMainWidget({this.countries, Key? key}) : super(key: key);

  @override
  _CountryMainWidgetState createState() => _CountryMainWidgetState();
}

class _CountryMainWidgetState extends State<CountryMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Countries'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: widget.countries?.length ?? 0,
            itemBuilder: (context, index) {
              CountryDTO? _country = widget.countries?[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 2, spreadRadius: 1)
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.map,
                          color: Theme.of(context).primaryColor,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(_country?.name ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                  'Capital  ${_country?.capital != '' ? _country?.capital ?? '' : 'not available'}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(color: Colors.black54)),
                            ),
                          ],
                        ),
                        SizedBox(
                            width: 100,
                            height: 50,
                            child: _country?.flag != ''
                                ? SvgPicture.network(
                                    _country?.flag ?? '',
                                    placeholderBuilder: (context) {
                                      return SizedBox(
                                          width: 100,
                                          child: Text(
                                              'Flag of ${_country?.name} is not available'));
                                    },
                                  )
                                : Text(
                                    'Flag of ${_country?.name} is not available'))
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
