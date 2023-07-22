import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Models/weather%20model.dart';
import 'package:weatherapp/Pages/SearchPage.dart';
import 'package:weatherapp/Providers/Weather%20Provider.dart';
import 'package:weatherapp/Services/Weather%20Service.dart';

class Home_page extends StatelessWidget {
  Home_page({super.key});
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: ThemeMode.light,
        leadingWidth: 10,
        title:  Text(
          'WeatherWise',
          style: TextStyle(color: Colors.white),
        ),
        leading: Container(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Search_Page();
                }));
              },
              icon:  Icon(
                Icons.search_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: weatherData == null
          ?  Center(
            child: Column(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                          'There is NO weather\nStart searching now',
                          style: TextStyle(fontSize: 24),
                        ),
                  Spacer(
                      flex: 3)
                ]),
          ) : Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 1,),
              Text(
                Provider.of<WeatherProvider>(context).cityName!,
                style: TextStyle(
                    fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                'Updated: ${weatherData!.date}',
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(

                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                      image: AssetImage(weatherData!.getImage() ?? '')
                  ),
                  Text(
                    weatherData!.temp!.toInt().toString(),
                    style: TextStyle(fontSize: 22),
                  ),
                  Column(
                    children: [
                      Text('Max: ${weatherData!.maxTemp!.toInt()}'),
                      Text('Min: ${weatherData!.minTemp!.toInt()}'),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                weatherData?.weatherState ?? "",
                style: TextStyle(fontSize: 24),
              ),
              Spacer(flex: 3,)
            ],
          ),
        ),
      ),
    );
  }
}
