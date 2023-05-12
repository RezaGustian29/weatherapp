import 'package:flutter/widgets.dart';
import 'package:weatherapp/model/api/weather_api.dart';
import 'package:weatherapp/model/weather_model.dart';

class WeatherViewModel with ChangeNotifier {
  List<Weather> _weathers = [];
  List<Weather> get weathers => _weathers;

  gettAllWeather() async {
    final w = await WeatherAPI.getWeather();
    _weathers = w;
    notifyListeners();
  }
}
