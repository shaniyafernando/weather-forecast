import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/data/models/weather_condition.dart';
import 'package:my_weather_app/presentation/cubits/location_text_field_cubit.dart';
import 'package:my_weather_app/presentation/cubits/weather_condition_cubit.dart';
import 'package:my_weather_app/presentation/utils/transform.dart';
import '../components/gradient_background.dart';
import 'dart:math' as math;

class CurrentWeatherView extends StatelessWidget {
  const CurrentWeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherCondition weatherCondition =
        context.watch<WeatherConditionCubit>().state.first;
    String dateTime = weatherCondition.dateTime;
    int temp = convertKelvinToCelsius(weatherCondition.temp);
    int tempMin = convertKelvinToCelsius(weatherCondition.tempMin);
    int tempMax = convertKelvinToCelsius(weatherCondition.tempMax);
    int tempFeelsLike = convertKelvinToCelsius(
      weatherCondition.tempFeelsLike,
    );
    String description = weatherCondition.main;
    int speed = convertMeterPerSecondToKiloMeterPerHour(
      weatherCondition.windSpeed,
    );
    int windDirection = weatherCondition.windDirection;
    String name = weatherCondition.name;
    String imgUrl = weatherCondition.icon;
    int humidity = weatherCondition.humidity;
    double? rain = weatherCondition.rain;
    double? snow = weatherCondition.snow;

    void showSearchDialog(BuildContext context) {
      final weatherConditionCubit = context.read<WeatherConditionCubit>();
      final textController = TextEditingController();
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              content: TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'City',
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    weatherConditionCubit.loadData(textController.text);
                    Navigator.of(context).pop();
                  },
                  child: Text("Add"),
                ),
              ],
            ),
      );
    }

    double rotateArrow(int windSpeed) => windSpeed * math.pi / 180;

    return GradiantBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: TextButton(
            onPressed: () => showSearchDialog(context),
            child: Icon(
              Icons.place_rounded,
              size: 25.0
            ),
          ),
          title: Text(name),
          actions: [
            TextButton(
              onPressed: () => context.read<ThemeCubit>().toggle(),
              child: Icon(
                context.watch<ThemeCubit>().isDark()
                    ? Icons.sunny
                    : Icons.nightlight_sharp,
                size: 25.0,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20.0,
                    children: [
                      Image.network(imgUrl, scale: 0.4),
                      Text(
                        dateTime,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '$temp\u00B0C',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        '$tempMin\u00B0C / $tempMax\u00B0C feels like $tempFeelsLike\u00B0C',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        spacing: 10.0,
                        children: [
                          RotatedBox(
                            quarterTurns: 1,
                            child: Transform.rotate(
                              angle: rotateArrow(windDirection),
                              child: Icon(Icons.arrow_back),
                            ),
                          ),
                          // IconButton(onPressed:(){},icon: Icon(Icons.air)),
                          Text(
                            'Wind',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            '$speed km/h',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        spacing: 10.0,
                        children: [
                          Icon(Icons.water_drop_outlined),
                          Text(
                            'Humidity',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            '$humidity%',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      if (rain != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          spacing: 10.0,
                          children: [
                            Icon(Icons.cloudy_snowing),
                            Text(
                              'Rain',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              '$rain mm/h',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      if (snow != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          spacing: 10.0,
                          children: [
                            Icon(Icons.ac_unit_rounded),
                            Text(
                              'Snow',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              '$snow mm/h',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}
