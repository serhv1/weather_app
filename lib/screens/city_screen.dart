import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                cursorColor: Colors.blueGrey[400],
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  hintText: 'Enter city name here...',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  filled: true,
                  fillColor: Colors.black54,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.black54,
                    size: 80,
                  ),
                ),
                onChanged: (value) {
                  cityName = value;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, cityName),
              child: const Text(
                'Get Forecast',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
