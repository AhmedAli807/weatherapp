import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  String?cityName;
  WeatherModel? _weatherData;
  set weatherData(WeatherModel? weather){
    _weatherData =weather;
    notifyListeners();
  }
  WeatherModel ?get weatherData=>_weatherData;
}