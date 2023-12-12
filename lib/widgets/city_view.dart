import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  const CityView({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot<WeatherForecast> snapshot;
  @override
  Widget build(BuildContext context) {
    final forecastList = snapshot.data?.list;
    final city = snapshot.data?.city?.name;
    final country = snapshot.data?.city?.country;
    final formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);
    return Column(
      children: [
        Text(
          '$city, $country',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
        Text(
          Util.getFormattedDate(formattedDate),
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
