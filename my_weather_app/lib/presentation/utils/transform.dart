

enum Month {
  january(1, "January"),
  february(2, "February"),
  march(3, "March"),
  april(4, "April"),
  may(5, "May"),
  june(6, "June"),
  july(7, "July"),
  august(8, "August"),
  september(9, "September"),
  october(10, "October"),
  november(11, "November"),
  december(12, "December");

  final int num;
  final String name;

  const Month(this.num, this.name);
}

enum Weekday {
  mon(1, "Monday"),
  tue(2, "Tuesday"),
  wed(3, "Wednesday"),
  thr(4, "Thursday"),
  fri(5, "Friday"),
  sat(6, "Saturday"),
  sun(7, "Sunday");

  final int num;
  final String name;

  const Weekday(this.num, this.name);
}

String getMonthName(int num) {
  String name = "Invalid name";
  for (var value in Month.values) {
    if (value.num == num) {
      name = value.name;
      break;
    }
  }
  return name;
}

String getWeekdayName(int num) {
  String name = "Invalid name";
  for (var value in Weekday.values) {
    if (value.num == num) {
      name = value.name;
      break;
    }
  }
  return name;
}

String convertUnixToTimestamp(int unix) {
  final timestamp = DateTime.fromMillisecondsSinceEpoch(unix,isUtc: true);
  final weekday = getWeekdayName(timestamp.weekday);
  final month = getMonthName(timestamp.month);
  final day = timestamp.day;
  return '$weekday, $day $month';
}

int convertKelvinToCelsius(double temp) => (temp - 273.15).round();

int convertMeterPerSecondToKiloMeterPerHour(double speed) => (speed * (18/5)).round();

