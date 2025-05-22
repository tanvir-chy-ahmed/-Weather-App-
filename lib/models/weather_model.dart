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

class Weather {
  final String cityName;
  final String temperature;
  final String description;
  final int humidity;
  final double windSpeed;
  final int sunrise;
  final int sunset;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
  });


  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
        cityName: json['name'],
        temperature: json['main']['temp'].toString(),
        description: json['weather'][0]['description'],
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed'],
        sunrise: json['sys']['sunrise'],
        sunset: json['sys']['sunset']
    );
  }
}
