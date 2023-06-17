import 'dart:convert';

import 'package:decoderweatherapp/weatherhelper.dart';
import 'package:http/http.dart' as http;

class Repo {
  getWeather(String? yourcity) async {
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$yourcity&units=metric&appid=b3257e61c452dcc761c19d2378555860";

    final res = await http.get(Uri.parse(url));

    var resBody = res.body;
    try {
      if (res.statusCode == 200) {
        return weatherhelper.fromJson(json.decode(resBody));
      }
    } catch (e) {
      throw Exception();
    }
  }
}
