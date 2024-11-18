import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp2/providers/weather_provider.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather Details')),
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          final weather = weatherProvider.weather;
          if (weather == null) return const Center(child: Text('No data available'));

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Temperature: ${weather.temperature}°C'),
                Text('Humidity: ${weather.humidity}%'),
                Text('Wind Speed: ${weather.windSpeed} m/s'),
                Text('Description: ${weather.description}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
