import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/data/repository/weather_condition_repo.dart';
import 'package:my_weather_app/presentation/cubits/weather_condition_cubit.dart';
import 'package:my_weather_app/presentation/views/current_weather_view.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({super.key});


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create:
          (context) => WeatherConditionCubit(WeatherConditionRepo()),
      child: CurrentWeatherView(),
    );
  }
}
