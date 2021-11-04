import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class Api_Manager {
  final baseurl = 'api.openweathermap.org';

  Future<WeatherModel> getWeatherData(String cityname) async {
    final url = Uri.https(baseurl, '/data/2.5/weather', {
      'q': cityname,
      'appid': '05fdaa09f4cac3887a5a831acf4fbfba',
      'units': 'metric',
    });
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    return WeatherModel.fromJson(json);
  }
}
