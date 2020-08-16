class Properties {
  final String id;
  final double lat;
  final double lng;

  Properties({this.lng , this.lat , this.id});

  Properties.fromJson(Map<dynamic, dynamic> parsedJson)
      :id = (parsedJson['financial_company'] !=null ) ? parsedJson['financial_company'] : null,
        lng = (parsedJson['lng'] != null) ? parsedJson['lng'] : null,
        lat = (parsedJson['lat'] != null) ? parsedJson['lat'] : null ;
}