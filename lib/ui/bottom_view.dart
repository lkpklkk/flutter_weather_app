import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/weather_model.dart';
import 'package:line_chart/charts/line-chart.widget.dart';
import 'package:line_chart/model/line-chart.model.dart';

import 'bottom_forecast_card.dart';

Widget bottomView(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data.daily;

  Column bottomView = Column(
    children: [
      Text("7day weather forcast"),
      Container(
        height: 160,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 8,
          ),
          itemCount: forecastList.length,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              child: bottomeForecastCard(forecastList[index]),
            ),
          ),
        ),
      )
    ],
  );

  return bottomView;
}
