import 'package:geolocator/geolocator.dart';

class LocationHelper{
  double lat,long;
  final defaultLat=28.5475;
  final defaultLong=77.2190;

  Future<double> getCurrentLat() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return  defaultLat;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return  defaultLat;

      }
    }

    else if (permission == LocationPermission.deniedForever) {
      return defaultLat;
    }
    else{
      Position position = await Geolocator.getCurrentPosition();
      lat = position.latitude;
      return lat;
    }
  }
  Future<double> getCurrentLong() async {

    bool serviceEnabledl;
    LocationPermission permissionl;

    serviceEnabledl = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabledl) {
      return defaultLong;
    }

    permissionl = await Geolocator.checkPermission();
    if (permissionl == LocationPermission.denied) {
      permissionl = await Geolocator.requestPermission();

      if (permissionl == LocationPermission.denied) {
        return  defaultLong;
      }
    }

    else if (permissionl == LocationPermission.deniedForever) {
      return defaultLong;
    }
    else{
      Position position = await Geolocator.getCurrentPosition();
      long = position.longitude;

      return long;
    }
  }
}