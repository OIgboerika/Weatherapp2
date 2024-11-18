import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:weatherapp2/providers/weather_provider.dart';
import 'package:weatherapp2/screens/forecast_screen.dart';
import 'package:weatherapp2/screens/home_screen.dart';
import 'package:weatherapp2/screens/weather_details_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const WeatherDetailsScreen(),
        '/forecast': (context) => const ForecastScreen(),
      },
    );
  }
}