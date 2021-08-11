import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = '9dad2874a5d48845921c1419f3c3dad7';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apikey&units=metric';
    Networkhelper networkhelper = Networkhelper(url);
    var weatherData = networkhelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    Networkhelper networkhelper = Networkhelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var weatherdata = await networkhelper.getData();
    return weatherdata;
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
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  String getWeathergif(int condition) {
    if (condition < 300) {
      return 'image/Thunderstorm.gif';
      //'🌩';
    } else if (condition < 400) {
      return 'image/drizzle.gif';
      //'🌧';
    } else if (condition < 600) {
      return 'heavy_rain.gif';
      //'☔️';
    } else if (condition < 700) {
      return 'snow-winter.gif';
      //'☃️';
    } else if (condition < 800) {
      return 'windy.gif';
      //'🌫';
    } else if (condition == 800) {
      return 'sun.gif';
      //'☀️';
    } else if (condition <= 804) {
      return 'cloudy.gif';
      //'☁️';
    } else {
      return 'location_background.jpg';
      //'🤷‍';
    }
  }
}
