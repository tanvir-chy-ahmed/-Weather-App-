import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
/*
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║              🌤️ WEATHER APP - MADE WITH FLUTTER              ║
║                                                              ║
║    💻 Developed by: Tanvir Ahmed (Chy)                       ║
║    📅 Created: 21 May 2025                                   ║
║    🔗 GitHub: https://github.com/tanvir-chy-ahmed            ║
║                                                              ║
║    📱 This app shows real-time weather info with dynamic     ║
║       gradient backgrounds based on the forecast.            ║
║                                                              ║
║                                                              ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
*/
class WeatherServices {
  final String apiKey = '932120143a21b31b78dd84bb015aa8b6';

  Future<Weather> fetchWeather(String cityName) async {
    final String url = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }
}
