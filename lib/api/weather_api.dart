import 'dart:convert';
import 'dart:developer' as dev;

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/utulities/constants.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {String? cityName}) async {
    var queryParameters = {
      'APPID': Constants.weatherAppId,
      'units': 'metric',
      'q': cityName,
    };

    var uri = Uri.https(
      Constants.weatherBaseUrlDomain,
      Constants.weatherForecastData,
      queryParameters,
    );
    dev.log(
      'request: ${uri.toString()}',
    );

    var response = await http.get(uri);

    dev.log('response ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(
        json.decode(
          response.body,
        ),
      );
    } else {
      throw Exception('Error occured!');
    }
  }
}
