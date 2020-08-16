import 'package:flutterapp1/pages/models/fundproperties.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class PropertiesService {
  Future<List<Properties>> getProperties() async {
    var response = await http.get('http://localhost:8000/api/propertys');
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['data'] as List;
    return jsonResult.map((Properties) => Properties.fromJson(Properties)).toList();
  }
}