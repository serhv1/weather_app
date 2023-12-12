import 'dart:convert';
import 'dart:developer' as dev;

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/utulities/constants.dart';
import 'package:weather_app/utulities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String?> parameters;

    if (isCity == true) {
      var queryParameters = {
        'appid': Constants.weatherAppId,
        'units': 'metric',
        'q': cityName,
      };
      parameters = queryParameters;
    } else {
      var queryParameters = {
        'appid': Constants.weatherAppId,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parameters = queryParameters;
    }

    var uri = Uri.https(
      Constants.weatherBaseUrlDomain,
      Constants.weatherForecastData,
      parameters,
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
      throw Future.error('Error occured!');
    }
  }
}
