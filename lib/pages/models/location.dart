import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

Future<Locations> getGoogleOffices() async {
  const googleLocationsURL = 'http://localhost:8000/api/propertys';

  // Retrieve the locations of Google offices
  final response = await http.get(googleLocationsURL);
  if (response.statusCode == 200) {
    return Locations.fromJson(convert.jsonDecode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
            ' ${response.reasonPhrase}',
        uri: Uri.parse(googleLocationsURL));
  }
}

// A function that converts a response body into a List<Locations.
List<Locations> parseLocations(String responseBody) {
  final parsed = convert.jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Locations>((json) => Locations.fromJson(json)).toList();
}

class Office {
  final int id;
  final double lat;
  final double lng;
  final String financial_company;

  Office({ this.id, this.lat, this.lng , this.financial_company});

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      id: json['id'] as int,
      lat: json['lat'] as double,
      lng: json['lng'] as double,
      financial_company: json['financial_company'] as String,
    );
  }
}

class Locations {
  Locations({
    this.offices,
  });

  factory Locations.fromJson(Map<String, dynamic> json)=>
      Locations.fromJson(json);
  Map<String, dynamic> toJson() => toJson();
  final List<Office> offices;
}