import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecast> snapshot, int index) {
  final forecastList = snapshot.data?.list;

  DateTime date = DateTime.fromMillisecondsSinceEpoch(
    forecastList![index].dt! * 1000,
  );

  final fullDate = Util.getFormattedDate(date);
  final dayOfWeek = fullDate.split(',')[0];
  final tempMin = forecastList[index].temp?.min?.toStringAsFixed(0);
  final icon = forecastList[index].getIconUrl();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          dayOfWeek,
          style: const TextStyle(
            fontSize: 25.0,
            color: Colors.black87,
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: Text(
                      '$tempMin °C',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  Image.network(
                    icon,
                    scale: 1.2,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          )
        ],
      )
    ],
  );
}
