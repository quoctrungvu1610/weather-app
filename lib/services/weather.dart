import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
const apiKey = '6353a9a3ee61b507626b96af6ebc8b20';
const openWeatherMapURL = "api.openweathermap.org";
const openWeatherMapPath = "/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName)async{
    var url = Uri.http(openWeatherMapURL,openWeatherMapPath,{"q":"$cityName","appid":"$apiKey","units":"metric"});
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  Future<dynamic> getLocationWeather()async{
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(url:Uri.http(openWeatherMapURL,openWeatherMapPath,{"lat":"${location.latitude}","lon":"${location.longitude}","appid":"$apiKey","units":"metric"}));
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}