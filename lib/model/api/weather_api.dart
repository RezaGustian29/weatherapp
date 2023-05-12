import 'package:dio/dio.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class WeatherAPI {
  static Future<List<Weather>> getWeather() async {
    final response = await Dio()
        .get("https://ibnux.github.io/BMKG-importer/cuaca/wilayah.json");
    List<Weather> weather = (response.data as List)
        .map(
          (e) => Weather(
            id: int.parse(e['id']),
            propinsi: e['propinsi'],
            kota: e['kota'],
            kecamatan: e['kecamatan'],
            lat: double.parse(e['lat']),
            lon: double.parse(e['lon']),
          ),
        )
        .toList();
    return weather;
  }
}

Future<List<dynamic>> fetchDataBMKG() async {
  //var uRL =
  //"https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-Indonesia.xml";
  var uRL =
      "https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-JawaBarat.xml";

  final result = await http.get(Uri.parse(uRL));
  final Xml2Json xml2json = Xml2Json();
  xml2json.parse(result.body);
  var json = xml2json.toGData();

  Map<String, dynamic> map = jsonDecode(json);
  return map['data']['forecast']['area'];
}
