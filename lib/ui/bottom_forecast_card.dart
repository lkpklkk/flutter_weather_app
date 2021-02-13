import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/weather_model.dart';
import 'package:flutter_weather_app/util/Util.dart';

Widget bottomeForecastCard(Daily dailyWeather) {
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMicrosecondsSinceEpoch(dailyWeather.dt * 1000000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.toString().split(',')[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(dayOfWeek),
      Text("weather:${dailyWeather.weather[0].main}"),
      Text("highest temp: ${dailyWeather.temp.max}"),
      Text("Humidity: ${dailyWeather.humidity}%")
    ],
  );
}
