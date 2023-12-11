import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  const TempView({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    final forecastList = snapshot.data?.list;
    final icon = forecastList![0].getIconUrl();
    final temperature = forecastList[0].temp?.day?.toStringAsFixed(0);
    final descrition = forecastList[0].weather?[0].description;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          icon,
          scale: 0.45,
          color: Colors.black87,
        ),
        const SizedBox(
          width: 0,
        ),
        Column(
          children: [
            Text(
              '$temperature°C',
              style: const TextStyle(
                fontSize: 54,
                color: Colors.black87,
              ),
            ),
            Text(
              '$descrition'.toUpperCase(),
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black45,
              ),
            )
          ],
        )
      ],
    );
  }
}
