import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/weather_condition.dart';

class WeatherConditionRepo {
  final _baseUrl = dotenv.env['BASE_URL'];
  final _apiKey = dotenv.env['API_KEY'];

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
