import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class Api_Manager {
  final baseurl = 'api.openweathermap.org';

  Future<List<WeatherModel>> getWeatherData() async {
    final url = Uri.https(baseurl, '/data/2.5/weather', {
      'q': 'vadodara',
      'appid': '05fdaa09f4cac3887a5a831acf4fbfba',
      'units': 'metric'
    });
    try {
      final http.Response respones = await http.get(url);
      final List<dynamic> json = jsonDecode(respones.body);
      print(json.runtimeType);
      List<WeatherModel> result =
          json.map((e) => WeatherModel.fromJson(e)).toList();
      return result;
    } catch (e) {
      throw e.toString();
    }
  }
}
