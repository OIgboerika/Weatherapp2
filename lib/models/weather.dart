class Weather {
  final String city;
  final double temperature;
  final int humidity;
  final double windSpeed;
  final String description;

  Weather({
    required this.city,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'] ?? '',
      temperature: (json['main']['temp'] as num).toDouble(),
      humidity: json['main']['humidity'] as int,
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      description: json['weather'][0]['description'] as String,
    );
  }
}