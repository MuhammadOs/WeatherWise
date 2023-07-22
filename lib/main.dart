import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Models/weather%20model.dart';
import 'package:weatherapp/Providers/Weather%20Provider.dart';

import 'Pages/HomePage.dart';
import 'Pages/SearchPage.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (BuildContext context) {
    return WeatherProvider();
  },
  child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WeatherWise",
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ? Colors.indigo : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor(),
        brightness: Brightness.light,
        primaryColorLight: Colors.blue,
        //useMaterial3: true,
      ),
      home: Home_page(),
    );
  }
}