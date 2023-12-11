import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/widgets/forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const BottomListView({
    super.key,
    required this.snapshot,
  });

  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '7-Day Weather Forecast'.toUpperCase(),
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 140,
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 8.0),
              itemBuilder: (context, index) => Container(
                    width: MediaQuery.of(context).size.width / 2.7,
                    height: 160,
                    color: Colors.black38,
                    child: Center(
                      child: forecastCard(snapshot, index),
                    ),
                  ),
              itemCount: snapshot.data!.list!.length),
        ),
      ],
    );
  }
}
