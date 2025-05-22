import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/widgets/weather_card.dart';
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
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherServices _weatherServices = WeatherServices();
  bool _isLoading = false;
  Weather? _weather;

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  void _getWeather() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final weather = await _weatherServices.fetchWeather(
        searchController.text,
      );
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Button click logic
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient:
              //condition ? valueIfTrue : valueIfFalse
              /*
          if (rain)
          {
             use rain gradient
          }else if (clear) {
            use clear gradient
          } else {
            use default gradient
          }

           */
              _weather != null &&
                      _weather!.description.toLowerCase().contains('rain')
                  ? LinearGradient(
                    colors: [Color(0xFF4B6CB7), Color(0xFF182848)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                  : _weather != null &&
                      _weather!.description.toLowerCase().contains('clear')
                  ? LinearGradient(
                    colors: [Color(0xFFFF8008), Color(0xFFFFC837)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                  : LinearGradient(
                    colors: [Color(0xFF8E9EAB), Color(0xFFEEF2F3)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 25),
                const Text(
                  'Weather App',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 25),

                TextField(
                  controller: searchController,
                  focusNode: searchFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Search Your City Name...',
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon: Icon(Icons.search, color: Colors.blueGrey),
                    suffixIcon:
                        searchController.text.isNotEmpty
                            ? IconButton(
                              icon: Icon(Icons.clear, color: Colors.blueGrey),
                              onPressed: () {
                                searchController.clear();
                                setState(() {});
                              },
                            )
                            : null,
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.blueGrey.shade300,
                        width: 1.5,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey.shade800,
                  ),
                  textInputAction: TextInputAction.search,
                  keyboardType: TextInputType.text,
                  autocorrect: true,
                  enableSuggestions: true,
                  cursorColor: Colors.blue,
                  onChanged: (value) {
                    setState(() {}); // Update suffix icon
                    // Add debounce logic if needed
                  },
                  onSubmitted: (value) {
                    // Perform search
                    _getWeather();
                  },
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: _getWeather,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text(
                      'Get Weather',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade700,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.blueGrey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),

                if (_isLoading)
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(color: Colors.white),
                  ),

                if (_weather != null) WeatherCard(weather: _weather!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//api- https://api.openweathermap.org/data/2.5/weather?q=sylhet&appid=4dfa71d4a0129d1bf66cb38d5bc55812
