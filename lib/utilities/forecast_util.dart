import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat(
      'EEE, MMM d, y',
    ).format(
      dateTime,
    );
  }

  static Column getItem(IconData iconData, int value, String units) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.black87,
          size: 28.0,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          '$value',
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Text(
          units,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
