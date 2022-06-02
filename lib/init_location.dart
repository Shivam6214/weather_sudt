import 'package:location/location.dart';
import 'package:weather/models.dart';
import 'data_service.dart';

class LocationHelperr{
  double lat,long;

  Future<double> getCurrentLat() async {
    Location location=Location();
    LocationData _locationData;

    _locationData=await location.getLocation();
    lat = _locationData.latitude;
    long =_locationData.longitude;

    return lat;
  }
  Future<double> getCurrentLong() async {
    Location location=Location();
    LocationData _locationData;

    _locationData=await location.getLocation();
    lat = _locationData.latitude;
    long =_locationData.longitude;

    return long;
  }
}