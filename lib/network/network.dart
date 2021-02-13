import 'dart:convert';

import 'package:flutter_weather_app/model/weather_model.dart';
import 'package:flutter_weather_app/util/Util.dart';
import 'package:http/http.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast() async {
    var url =
        "https://api.openweathermap.org/data/2.5/onecall?lat=33.441792&units=metric&lon=-94.037689&exclude=current,minutely,alerts,hourly&appid=0f16740be0b1228a44e1684e12f8d26c";
    final response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      print(response.body);
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }
  }
}
