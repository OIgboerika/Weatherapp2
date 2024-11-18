import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp2/models/weather.dart';
import 'package:weatherapp2/providers/weather_provider.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('5-Day Forecast')),
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          return FutureBuilder<List<Weather>>(
            future: weatherProvider.getForecast(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData) {
                return const Center(child: Text('No forecast data available'));
              }

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final forecast = snapshot.data![index];
                  return ListTile(
                    title: Text('Day ${index + 1}'),
                    subtitle: Text('${forecast.temperature}°C - ${forecast.description}'),
                    leading: const Icon(Icons.cloud),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
