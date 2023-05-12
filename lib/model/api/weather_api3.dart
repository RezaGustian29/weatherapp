import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

Future<List<dynamic>> fetchDataBMKG() async {
  var uRL =
      "https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-JawaBarat.xml";

  final result = await http.get(Uri.parse(uRL));
  final Xml2Json xml2json = Xml2Json();
  xml2json.parse(result.body);
  var json = xml2json.toGData();

  Map<String, dynamic> map = jsonDecode(json);
  return map['data']['forecast']['area'];
}
