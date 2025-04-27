import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_condition.dart';

class WeatherConditionRepo {
  final _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final _apiKey = '8ad6a8d6867bfb1bbe4b6a6b2a463799';

  Future<List<WeatherCondition>> getForecastForFiveDays(String city) async {
    final response = await http.get(
      Uri.parse('$_baseUrl?q=$city&appid=$_apiKey'),
    );
    final json = jsonDecode(response.body) as Map<String, dynamic>;

    List<WeatherCondition> forecastList = [];

    forecastList.add(WeatherCondition.fromJson(json));

    return forecastList;
  }
}
