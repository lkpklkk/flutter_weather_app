import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/weather_model.dart';
import 'package:flutter_weather_app/util/Util.dart';
import 'package:line_chart/charts/line-chart.widget.dart';
import 'package:line_chart/model/line-chart.model.dart';

Widget midView(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data.daily;
  var morning_temp = snapshot.data.daily[0].temp.morn;
  var day_temp = snapshot.data.daily[0].temp.day;
  var eve_temp = snapshot.data.daily[0].temp.eve;
  var night_temp = snapshot.data.daily[0].temp.night;
  List<LineChartModel> temp_data = [
    LineChartModel(date: DateTime(2020, 1, 1), amount: morning_temp),
    LineChartModel(date: DateTime(2020, 1, 2), amount: day_temp),
    LineChartModel(date: DateTime(2020, 1, 10), amount: eve_temp),
    LineChartModel(date: DateTime(2020, 1, 1), amount: night_temp)
  ];

  Container midView = Container(
    padding: EdgeInsets.symmetric(vertical: 50),
    child: Column(
      children: [
        Text(
          "Demo City, Demo country",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(Util.getFormattedDate(DateTime.fromMicrosecondsSinceEpoch(
            snapshot.data.daily[0].dt * 1000000))),
        Divider(
          height: MediaQuery.of(context).size.width * 0.1,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: LineChart(
            width:
                MediaQuery.of(context).size.width * 0.8, // Width size of chart
            height: MediaQuery.of(context).size.width *
                0.12, // Height size of chart
            data: temp_data, // The value to the chart
            linePaint: Paint()
              ..strokeWidth = 3
              ..style = PaintingStyle.stroke
              ..color = Colors.black, // Custom paint for the line
          ),
        ),
        Divider(
          height: MediaQuery.of(context).size.width * 0.05,
          color: Colors.white,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Morn:$morning_temp "),
            Text("Day:$day_temp "),
            Text("Even:$eve_temp "),
            Text("Night:$night_temp")
          ],
        )
      ],
    ),
  );

  return midView;
}
