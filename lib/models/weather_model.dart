
import 'package:flutter/material.dart';

class WeatherModel {
  String date;

  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date : data['location']['localtime'],
        temp : jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }
  String getImage(){
    if (weatherStateName =='Thunderstorm'||weatherStateName=='Thunder'){
      return'assets/images/scatterad-thunderstorm.png';
  }
  else if(weatherStateName =='Clear'||weatherStateName=='Light Cloud'){
      return'assets/images/cloudy-clear.png';
  }
  else if(weatherStateName=='Snow'||weatherStateName=='Hail'||weatherStateName=='Sleet'){
  return 'assets/images/snow.png';}
  else if(weatherStateName=='Heavy Cloud'){
        return 'assets/images/cloudy.png';
    }
  else if(weatherStateName=='Heavy Rain'||weatherStateName=='Showers'||weatherStateName=='Light Rain'||weatherStateName=='Patchy rain possible'){
return 'assets/images/rainly.png';
    }

  else {
return 'assets/images/cloud.png';
    }
  }
  MaterialColor getThemeColor(){
    if (weatherStateName =='Thunderstorm'||weatherStateName=='Thunder'){
      return Colors.brown;
  }
  else if(weatherStateName =='Clear'||weatherStateName=='Light Cloud'){
      return Colors.orange;
  }
  else if(weatherStateName=='Snow'||weatherStateName=='Hail'||weatherStateName=='Sleet'){
  return Colors.blue;}
  else if(weatherStateName=='Heavy Cloud'){
        return Colors.blueGrey;
    }
  else if(weatherStateName=='Heavy Rain'||weatherStateName=='Showers'||weatherStateName=='Light Rain'||weatherStateName=='Patchy rain possible'){
return Colors.blue;
    }

  else {
return Colors.orange;
    }
  }
}
