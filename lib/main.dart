import 'package:flutter/material.dart';
import 'package:weatherapp/screen/weather/weather_detail_save_screen.dart';
//import 'package:weatherapp/screen/weather/dashboard_screen.dart';
import 'package:weatherapp/screen/weather/weather_dashboard_screen.dart';
//import 'package:weatherapp/screen/weather/weather_details_screen.dart';
//import 'package:weatherapp/screen/weather/search.dart';
import 'package:weatherapp/screen/weather/weather_screen.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/screen/weather_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => WeatherViewModel(),
      )
    ],
    child: MaterialApp(
      /* home: WeatherScreen(
        title: '',
      ), */
      home: WeatherSavePage(
        item: {},
        title: '',
      ),
    ),
  ));
}

/* class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherScreen(),
    );
  }
} */
