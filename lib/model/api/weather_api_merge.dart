/* import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

Future<List<dynamic>> fetchData() async {
  //var uRL =
  //"https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-Indonesia.xml";
  var uRL =
      "https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-JawaBarat.xml?areaid=501212";

  final result = await http.get(Uri.parse(uRL));
  final Xml2Json xml2json = Xml2Json();
  xml2json.parse(result.body);
  var json = xml2json.toGData();

  Map<String, dynamic> map = jsonDecode(json);
  return map['data']['forecast']['area'];
}





/* Future<Map<String, dynamic>> fetchBandungWeather() async {
  var uRL =
      "https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-JawaBarat.xml";
  final result = await http.get(Uri.parse(uRL));

  final Xml2Json xml2json = Xml2Json();
  xml2json.parse(result.body);
  var json = xml2json.toGData();
  Map<String, dynamic> map = jsonDecode(json);

  // Mencari data cuaca Kabupaten Bandung
  var bandungData = map['data']['forecast']['area']
      .firstWhere((area) => area['name'] == 'Bandung');

  // Menyiapkan data untuk ditampilkan
  Map<String, dynamic> bandungWeather = {
    'name': bandungData['name'],
    'temperature': bandungData['parameter']
        .firstWhere((param) => param['name'] == 'T')
        .values
        .first,
    'weather': bandungData['parameter']
        .firstWhere((param) => param['name'] == 'Cuaca')
        .values
        .first,
  };

  return bandungWeather;
} */





/* import 'package:dio/dio.dart';
import 'package:weatherapp/model/weather_model2.dart';

class WeatherAPI {
  static Future<List<Weather2>> getWeather() async {
    final response = await Dio()
        .get("https://ibnux.github.io/BMKG-importer/cuaca/501233.json");
    List<Weather2> weather2 = (response.data as List)
        .map(
          (e) => Weather2(
              id: e['id'],
              jamCuaca: e['jamCuaca'],
              kodeCuaca: e['kodeCuaca'],
              cuaca: e['cuaca'],
              humidity: e['humidity'],
              tempC: e['tempC'],
              tempF: e['tempF']),
        )
        /* .map(
          (e) => Weather(
            id: int.parse(e['id']),
            propinsi: e['propinsi'],
            kota: e['kota'],
            kecamatan: e['kecamatan'],
            lat: double.parse(e['lat']),
            lon: double.parse(e['lon']),
          ),
        ) */
        .toList();
    return weather2;
  }
} */
 */