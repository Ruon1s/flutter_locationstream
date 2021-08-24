import 'dart:async';

import 'package:location/location.dart';
import 'package:first_location_app/datamodels/user_location.dart';

class LocationService {
  late UserLocation _currentLocation;
  Location location = Location();

  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>.broadcast();

  Stream<UserLocation> get locationStream => _locationController.stream;

  LocationService() {
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted) {
        location.onLocationChanged.listen((locationData) {
          if (locationData.latitude != null) {
            _locationController.add(
                UserLocation(locationData.latitude, locationData.longitude));
          }
        });
      }
    });
  }

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation =
          UserLocation(userLocation.latitude, userLocation.longitude);
    } catch (e) {
      print('couldnt get the location: $e');
    }
    return _currentLocation;
  }
}
