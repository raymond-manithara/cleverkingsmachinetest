import 'package:architecture_latest/common/registry/injection_registry.dart';
import 'package:architecture_latest/screens/home/home_view_model.dart';
import 'package:architecture_latest/screens/home/widgets/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeViewModel _viewModel;
  @override
  void initState() {
    _viewModel = getIt.get<HomeViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _viewModel,
      child: Material(
        child: Center(
          child: HomeMainWidget(),
        ),
      ),
    );
  }
}
