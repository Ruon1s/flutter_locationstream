import 'package:first_location_app/datamodels/user_location.dart';
import 'package:first_location_app/screens/home_view.dart';
import 'package:first_location_app/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() => runApp(LocationApp());

class LocationApp extends StatelessWidget {
  UserLocation initialData = UserLocation(0.0, 0.0);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
        initialData: initialData,
        create: (context) => LocationService().locationStream,
        child: MaterialApp(
            home: Scaffold(
          appBar: AppBar(
            title: Text('Location App'),
            centerTitle: true,
          ),
          body: Container(child: HomeView()),
        )));
  }
}
