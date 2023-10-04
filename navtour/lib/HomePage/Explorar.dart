import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class Explorar extends StatefulWidget {
  const Explorar({super.key});

  @override
  State<Explorar> createState() => _ExplorarState();
}

class _ExplorarState extends State<Explorar> {
  List<LatLng> routpoints = [LatLng(52.05884, -1.345583)];

  late final MapController mapController;
  late LocationData currentLozation;
  double? lat; 
  double? long; 
  Set<Marker> markers = {};
  final Icon markerIcon = Icon(
    Icons.pin_drop, 
    color: Colors.blue, 
    size: 48, 
  ); 
  @override
  void initState() {
    mapController = MapController(); 
    super.initState(); 
  }
  void getCurrentLozation() async {
    var location = Location();  
    print(location);
    currentLozation = await location.getLocation();
    lat = currentLozation.latitude;
    long = currentLozation.longitude;
    setState(() {
      mapController.move(LatLng(lat!, long!), 15.0);
    });
  }

  void addMarker(LatLng point) async {
    markers.clear(); 
    final marker = CustomMarker(
    point: point, icon: markerIcon
  ); 
  var longFinal = point.longitude; 
  var latFinal = point.latitude; 
  var url = Uri.parse(
        'http://router.project-osrm.org/route/v1/driving/$long,$lat;$longFinal,$latFinal?steps=true&annotations=true&geometries=geojson&overview=full');
  var response = await http.get(url);
  setState(() {
      markers.add(marker);
      routpoints = [];
      var ruter =
          jsonDecode(response.body)['routes'][0]['geometry']['coordinates'];
      for (int i = 0; i < ruter.length; i++) {
        var reep = ruter[i].toString();
        reep = reep.replaceAll("[", "");
        reep = reep.replaceAll("]", "");
        var lat1 = reep.split(',');
        var long1 = reep.split(",");
        routpoints.add(LatLng(double.parse(lat1[1]), double.parse(long1[0])));
      }
      print(routpoints);
    });
  }

  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            FlutterMap(options: MapOptions(
              center: LatLng(51.509364, -0.128928), 
              zoom: 15.0,
              onTap: (tapPosition, point) {
                print(point);
                addMarker(point);
              },
            ),
            mapController: mapController,
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
              MarkerLayer(markers: markers.toList()), 
              PolygonLayer(polygonCulling: false,
              polygons: [
                Polygon(points: routpoints, 
                color: Colors.cyan, borderStrokeWidth: 2)
              ],)
            ],
            ),
            Column(
              children: [
                Text("Oi", style: TextStyle(color: Colors.red,
                fontSize: 40),),
              ],
            ),
          ],
        ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ); //Material App
  }
}

class CustomMarker extends Marker {
  CustomMarker({
    required LatLng point,
    required Icon icon,
    String? width,
    String? height,
    AnchorPos? anchorPos,
    bool rotate = false,
  }) : super(
          point: point,
          builder: (BuildContext context) {
            return Icon(
              icon.icon,
              color: icon.color,
              size: icon.size,
            );
          },
          anchorPos: anchorPos,
          rotate: rotate,
        );
}