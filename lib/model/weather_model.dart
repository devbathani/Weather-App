class WeatherModel {
  WeatherModel({
    required this.coord,
    required this.weather,
    required this.main,
    required this.name,
  });

  Coord coord;
  Weather weather;
  Main main;
  String name;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        coord: Coord.fromJson(json["coord"]),
        weather: Weather.fromJson(json["weather"]),
        main: Main.fromJson(json["main"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": weather.toJson(),
        "main": main.toJson(),
        "name": name,
      };
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  double lon;
  double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
      };
}

class Weather {
  Weather({
    required this.main,
  });

  String main;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        main: json["main"],
      );

  Map<String, dynamic> toJson() => {
        "main": main,
      };
}
