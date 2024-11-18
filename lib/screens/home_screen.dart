import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp2/providers/weather_provider.dart';
import 'package:weatherapp2/widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: 'Enter city name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    weatherProvider.fetchWeather(_cityController.text);
                  },
                  child: const Text('Get Weather'),
                ),
                const SizedBox(height: 16),
                if (weatherProvider.isLoading)
                  const CircularProgressIndicator()
                else if (weatherProvider.error != null)
                  Text(
                    'Error: ${weatherProvider.error}',
                    style: const TextStyle(color: Colors.red),
                  )
                else if (weatherProvider.weather != null)
                  WeatherCard(
                    weather: weatherProvider.weather!,
                    onTap: () => Navigator.pushNamed(context, '/details'),
                  ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/forecast'),
        child: const Icon(Icons.calendar_today),
      ),
    );
  }
}