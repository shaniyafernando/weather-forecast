class WeatherCondition {
  final String name;
  final double longitude;
  final double latitude;
  final String dateTime;
  final int id;
  final String main;
  final String description;
  final String icon;
  final double temp;
  final double tempMin;
  final double tempMax;
  final double tempFeelsLike;
  final int humidity;
  final double windSpeed;
  final int windDirection;
  final double? rain;
  final double? snow;

  WeatherCondition( {
    required this.name,
    required this.longitude,
    required this.latitude,
    required this.dateTime,
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
    required this.temp,
    required this.windSpeed,
    required this.windDirection,
    required this.tempMin,
    required this.tempMax,
    required this.tempFeelsLike,
    required this.humidity,
    this.rain,
    this.snow,
  });

  WeatherCondition.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      longitude = json['coord']['lon'],
      latitude = json['coord']['lat'],
      dateTime = json['dt_txt'] ?? '',
      id = json['weather'][0]['id'],
      main = json['weather'][0]['main'],
      description = json['weather'][0]['description'],
      icon = 'https://openweathermap.org/img/wn/${json['weather'][0]['icon']}@2x.png',
      temp = json['main']['temp'],
      tempMin = json['main']['temp_min'],
      tempMax = json['main']['temp_max'],
      tempFeelsLike = json['main']['feels_like'],
      humidity = json['main']['humidity'],
      windSpeed = json['wind']['speed'],
      windDirection = json['wind']['deg'],
      rain = json['rain'] == null ? null : json['rain']['3h'],
      snow = json['snow'] == null ? null : json['snow']['3h'];

  @override
  String toString() {
    return 'weatherCondition:{name:$name, longitude:$longitude, latitude:$latitude, dateTime:$dateTime, id:$id, main:$main, description:$description, icon:$icon, temp:$temp, windSpeed:$windSpeed}';
  }
}
