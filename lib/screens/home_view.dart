import 'package:first_location_app/datamodels/user_location.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Column(
      children: [
        Text(
          'lat:${userLocation.latitude}',
          style: TextStyle(fontSize: 25),
        ),
        Text(
          'lon:${userLocation.longitude}',
          style: TextStyle(fontSize: 25),
        )
      ],
    );
  }
}
