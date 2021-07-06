import 'package:architecture_latest/screens/countries/country.dart';
import 'package:architecture_latest/screens/home/home.dart';
import 'package:architecture_latest/screens/home/home_view_model.dart';
import 'package:architecture_latest/screens/home/model/country_dto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeMainWidget extends StatefulWidget {
  const HomeMainWidget({Key? key}) : super(key: key);

  @override
  _HomeMainWidgetState createState() => _HomeMainWidgetState();
}

class _HomeMainWidgetState extends State<HomeMainWidget> {
  @override
  void initState() {
    Future.microtask(() async {
      await context.read<HomeViewModel>().downloadDataFromAPI();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.language),
        title: Text('Regions'),
      ),
      body: context.watch<HomeViewModel>().isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(20),
              child: ListView.builder(
                  itemCount:
                      context.watch<HomeViewModel>().regions?.length ?? 0,
                  itemBuilder: (context, index) {
                    String? _region =
                        context.watch<HomeViewModel>().regions?[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        tileColor: Colors.black12,
                        leading: Icon(Icons.language),
                        title: Text(_region != '' ? _region ?? '' : 'Others',
                            style: Theme.of(context).textTheme.subtitle1),
                        onTap: () {
                          List<CountryDTO>? _filteredList = context
                              .read<HomeViewModel>()
                              .filterListWithRegion(_region);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Country(
                                    countries: _filteredList,
                                  )));
                        },
                      ),
                    );
                  }),
            ),
    );
  }
}
