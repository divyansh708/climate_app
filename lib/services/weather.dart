import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiCode = "332e90a40f7a6ef6044c2e5fda0e39db";
const apiURL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {

  late double temperature;
  late int weatherCondition;
  late String cityName;

  Future<dynamic> getCityWeather(String city) async{
    GetData data = GetData("$apiURL?q=$city&appid=$apiCode&units=metric");
    var weatherData = await data.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getLocation();

    GetData data = GetData("$apiURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiCode&units=metric");
    var weatherData = await data.getData();
    return weatherData;
  }

  void getWeatherData(var stringData){
    if(stringData == Null){
      temperature = 404;
      weatherCondition = 1000;
      cityName = "";
      return;
    }
    temperature = stringData['main']['temp'];
    weatherCondition = stringData['weather'][0]['id'];
    cityName = stringData['name'];
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp == 404){
      return 'Error finding weather';
    }else if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
