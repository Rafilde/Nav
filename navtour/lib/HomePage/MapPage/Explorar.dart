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
    final marker = CustomMarker(point: point, icon: markerIcon);
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
            FlutterMap(
              options: MapOptions(
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
                MarkerLayer(
                  //markers: markers.toList()
                  markers: [
                    Marker(
                      width: 40.0,
                      height: 40.0,
                      point: LatLng(51.5, -0.09), // Coordenadas do marcador
                      builder: (ctx) => Container(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40.0,
                        ),
                      ),
                    ),
                    // Adicione mais marcadores conforme necessário
                  ],
                ),
                PolygonLayer(
                  polygonCulling: false,
                  polygons: [
                    Polygon(
                        points: routpoints,
                        color: Colors.cyan,
                        borderStrokeWidth: 2)
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: 15, left: 15, top: 25, bottom: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(30, 0, 0, 0),
                              offset: Offset(0, 0),
                              blurRadius: 6),
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          prefixIcon: Icon(Icons.search,
                              color: Color.fromARGB(255, 116, 116, 116)),
                          border: InputBorder.none,
                          hintText: "Pesquisar",
                          hintStyle: TextStyle(color: Color(0xFF9C9C9C))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15, right: 15),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(30, 0, 0, 0),
                            offset: Offset(0, 0),
                            blurRadius: 6),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.light_mode_outlined,
                        color: Colors.blue,
                      ),
                      iconSize: 25,
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15, right: 15),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(30, 0, 0, 0),
                            offset: Offset(0, 0),
                            blurRadius: 6),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.cloud_queue,
                        color: Colors.blue,
                      ),
                      iconSize: 25,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: 40, // Altura do seu ListView
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _filterTags("Restaurantes"),
                    _filterTags("Academias"),
                    _filterTags("Hotéis"),
                    _filterTags("Shoppings"),
                    _filterTags("Farmácias"),
                    _filterTags("Museus"),
                    _moreFilter("mais..."),
                  ],
                ),
              ),
            ),
            /*Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _filterTags("Restaurantes"),
                      _filterTags("Academias"),
                      _filterTags("Hotéis"),
                      _filterTags("Shoppings"),
                      _filterTags("Farmácias"),
                      _filterTags("Museus"),
                      _moreFilter("mais..."),
                    ],
                  ),
                ),
              ],
            ),*/
          ],
        ),
      ),
    );
  }

  Widget _moreFilter(String filterName) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 15, right: 15),
      child: InputChip(
        elevation: 2,
        shadowColor: Color.fromARGB(93, 0, 0, 0),
        label: Text(
          filterName,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/filtros');
        },
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  Widget _filterTags(String filterName) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 15),
      child: InputChip(
      elevation: 2,
      shadowColor: Color.fromARGB(93, 0, 0, 0),
      label: Text(
        filterName,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      onPressed: () {
        print('Tag "$filterName" clicada.');
      },
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
    );
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
