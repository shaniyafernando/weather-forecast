import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/data/models/weather_condition.dart';
import 'package:my_weather_app/data/repository/weather_condition_repo.dart';

class WeatherConditionCubit extends Cubit<List<WeatherCondition>> {
  final WeatherConditionRepo weatherConditionRepo;

  WeatherConditionCubit(this.weatherConditionRepo) : super([]) {
    loadData('Colombo');
  }

  void loadData(String city) async {
    List<WeatherCondition> list  = await weatherConditionRepo
        .getForecastForFiveDays(city);
    emit(list);
  }
}
