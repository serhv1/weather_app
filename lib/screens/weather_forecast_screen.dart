import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/widgets/bottom_list_view.dart';
import 'package:weather_app/widgets/city_view.dart';
import 'package:weather_app/widgets/detail_view.dart';
import 'package:weather_app/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();
    forecastObject = WeatherApi().fetchWeatherForecastWithCity(
      cityName: _cityName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'openweather.com',
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.my_location,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () async {
              var tappedName = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CityScreen(),
                ),
              );
              if (tappedName != null) {
                _cityName = tappedName;
                forecastObject = WeatherApi().fetchWeatherForecastWithCity(
                  cityName: _cityName,
                );
              }
            },
            icon: const Icon(
              Icons.location_city,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          FutureBuilder<WeatherForecast>(
            future: forecastObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    CityView(snapshot: snapshot),
                    const SizedBox(
                      height: 24,
                    ),
                    TempView(snapshot: snapshot),
                    const SizedBox(
                      height: 24,
                    ),
                    DetailView(snapshot: snapshot),
                    const SizedBox(
                      height: 64,
                    ),
                    BottomListView(snapshot: snapshot),
                  ],
                );
              } else {
                return const Center(
                  child: SpinKitDoubleBounce(
                    color: Colors.pink,
                    size: 128,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
