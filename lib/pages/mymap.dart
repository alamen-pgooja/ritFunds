import 'dart:async';
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp1/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MyMap extends StatefulWidget with NavigationStates {
  @override
  _MyMapState createState() => _MyMapState();
}

//GoogleMapController _controller;
class _MyMapState extends State<MyMap> {
  GoogleMapController _controller;
  //Completer<GoogleMapController> _controller = Completer()
  bool isMapCreated = false;
  final LatLng _center = const LatLng(24.7255553, 47.1027142);
  changeMapMode() {
    getJesonFile("assets/dark.json").then(setMapStyle);
  }

  Future<String> getJesonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(mapStyle) {
    _controller.setMapStyle(mapStyle);
  }
  /*void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }*/

  Future<List<Property>> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull("http://10.0.2.2:8000/api/propertys"),
        headers: {"Accept": "application/json"});
    print("responseBody: " + response.body);
    //return Property.fromJson(data);
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['data'] as List;
    return jsonResult.map((data) => data.fromJson(data)).toList();
  }

  MapType _currentMapType = MapType.normal;

  List<Marker> markers = [];

  void initState() {
    super.initState();
    latLangs.forEach((element) {
      markers.add(
          Marker(markerId: MarkerId(element.toString()), position: element));
    });
    markers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        onTap: () {
          print('My Marker');
        },
        position: LatLng(24.7255553, 47.1027142)));
  }

//by amen
  final List<LatLng> latLangs = [
    LatLng(25.456647601115794, 47.342224940657616),
    LatLng(24.914258846373837, 47.58199967443943),
    LatLng(24.01251035336433, 47.46217802166939),
    LatLng(23.840881602122618, 46.2835818529129),
    LatLng(24.903510540971226, 45.95203164964914),
    LatLng(23.932140365302953, 46.291614063084126),
    LatLng(25.048412056256403, 45.96401408314705),
    LatLng(26.03943829865185, 46.691106632351875),
    LatLng(25.46378078807016, 47.42215007543564),
    LatLng(24.587816553166014, 47.72183530032635),
  ];

  @override
  Widget build(BuildContext context) {
    var data = getData();
    print(data);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('عقارات الصندوق', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            GoogleMap(
              onTap: (LatLng latlang) {
                print(latlang.toString());
              },
              onLongPress: (LatLng latLng) {},
              mapType: _currentMapType,
              onMapCreated: (GoogleMapController controller) {
                controller = _controller;
                isMapCreated = false;
                changeMapMode();
                setState(() {});
              },
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 7.0,
              ),
              markers: Set.from(markers),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  onPressed: getData,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Color(0xFF9B1C21),
                  child: const Icon(Icons.map, size: 36.0),
                ),
              ),
            ),

            //_buildContainer()
            //_buildContainer()
          ],
        ),
      ),
    );
  }
}

/*Widget _googleMap(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(target: LatLng(24.7255553 , 47.1027142) , zoom: 7.0),
      onMapCreated: (GoogleMapController controller) {
        //_controller.complete(controller);
        _controller = _controller;
      },
      markers: {
        propartyMarkers
      },
    ),
  );
}*/
/*Marker propartyMarkers = Marker(
    markerId: MarkerId('myMarker'),
    draggable: false,
    onTap: () {
      print('My Marker');
    },
    position: LatLng(24.7255553 , 47.1027142)
);*/

/*Widget _buildContainer() {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(8),
            child: _boxes(
                "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                40.738380, -73.988426,"Gramercy Tavern"),
          ),
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(8),
            child: _boxes(
                "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                40.738380, -73.988426,"Gramercy Tavern"),
          ),
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(8),
            child: _boxes(
                "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                40.738380, -73.988426,"Gramercy Tavern"),
          ),
        ],
      ),
    ),
  );
}*/

/*Widget _boxes(String _image, double lat,double long,String restaurantName) {
  return  GestureDetector(
    onTap: () {
      _gotoLocation(lat,long);
    },
    child:Container(
      child: new FittedBox(
        child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 180,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(24.0),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(_image),
                    ),
                  ),),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myDetailsContainer1(restaurantName),
                  ),
                ),

              ],)
        ),
      ),
    ),
  );
}*/

/*Future<void> _gotoLocation(double lat , double long) async {
  final GoogleMapController controller = await _controller.future;
  controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat , long), zoom: 15,tilt: 50,bearing: 45)));
}*/

class Property {
  final int id;
  final String lat;
  final String lng;

  //final String email;
  //final Address address;

  Property({this.id, this.lat, this.lng});

  Property.fromJson(Map<dynamic, dynamic> parsedJson)
      : id = (parsedJson['id'] != null) ? parsedJson['id'] : null,
        lng = (parsedJson['lng'] != null) ? parsedJson['lng'] : null,
        lat = (parsedJson['lat'] != null) ? parsedJson['lat'] : null;
//email: propertyjson["email"],

}
