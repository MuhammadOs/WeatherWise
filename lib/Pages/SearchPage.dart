import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Providers/Weather%20Provider.dart';

import '../Models/weather model.dart';
import '../Services/Weather Service.dart';

String? cityName;
class Search_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.indigo,
          title: const Text(
            'Search for a city',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('Assets/animation_lkdypl8n.json', animate: true),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: (data) {
                      cityName = data;
                    },
                    onSubmitted: (data) async {
                      cityName = data;

                      WeatherService service = WeatherService();

                      WeatherModel? weather =
                      await service.getWeather(cityName: cityName!);
                      Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                      Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;


                      Navigator.pop(context);
                    },
                    decoration: InputDecoration(
                        label: const Text('Search here ..'),
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            WeatherService service = WeatherService();

                            WeatherModel? weather =
                            await service.getWeather(cityName: cityName!);
                            Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                            Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;


                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.search_sharp,
                            color: Colors.indigo,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Enter a city to search for'),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
