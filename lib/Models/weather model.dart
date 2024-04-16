import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel
{
  String? date;
  String? image;
  double? temp;
  double? maxTemp;
  double? minTemp;
  String? weatherState;

  WeatherModel({required this.date, required this.image, required this.temp, required this.maxTemp, required this.minTemp,required this.weatherState});
  factory WeatherModel.fromJson (dynamic data){
    var JsonData = data ['forecast']['forecastday'][0]["day"];
    return WeatherModel(
        date: data ['current']['last_updated'],
        image: JsonData['condition']['icon'],
        temp: JsonData['avgtemp_c'],
        maxTemp: JsonData['maxtemp_c'],
        minTemp: JsonData['mintemp_c'],
        weatherState: JsonData['condition']['text'],
    );
  }

  String getImage () {
    if(weatherState == 'Thunderstorm'||weatherState == 'Thunder')
      {
        return 'Assets/Images/thunderstorm.png';
      }
    else if(weatherState == 'Clear' || weatherState == 'Light cloud' || weatherState == 'Sunny'){
      return 'Assets/Images/clear.png';
    }
    else if(weatherState == 'Sleet' || weatherState == 'Snow' || weatherState == 'Hail'){
      return 'Assets/Images/snow.png';
    }
    else if(weatherState == 'Heavy cloud' || weatherState == 'Partly Cloudy'){
      return 'Assets/Images/cloudy.png';
    }
    else if(weatherState == 'Light rain' || weatherState == 'Heavy rain' || weatherState == 'Showers' || weatherState == 'Patchy rain nearby'){
      return 'Assets/Images/rainy.png';
    }
    else {
      return 'Assets/Images/clear.png';
    }
  }

  MaterialColor getThemeColor () {
    if(weatherState == 'Thunderstorm' ||weatherState == 'Thunder' )
    {
      return Colors.blue;
    }
    else if(weatherState == 'Clear' || weatherState == 'Light cloud' || weatherState == 'Sunny'){
      return Colors.orange;
    }
    else if(weatherState == 'Sleet' || weatherState == 'Snow' || weatherState == 'Hail'){
      return Colors.blue;
    }
    else if(weatherState == 'Heavy cloud' || weatherState == 'Partly Cloudy'){
      return Colors.blueGrey;
    }
    else if(weatherState == 'Light rain' || weatherState == 'Heavy rain' || weatherState == 'Showers' || weatherState == 'Patchy rain nearby'){
      return Colors.blue;
    }
    else {
      return Colors.red;
    }
  }

  @override
  String toString() {
    return 'temp = $temp \nmintemp = $minTemp\nmaxtemp = $maxTemp\nweather state name = $weatherState\nDate = $date';
  }
}