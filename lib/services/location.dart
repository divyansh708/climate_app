import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude, longitude;
  Future<void>  getLocation() async {
    print("hello1");
    try {
      print("hello2");
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print("hello3");
      latitude = position.latitude;
      longitude = position.longitude;
    } catch(e){
      print(e);
    }
  }

}