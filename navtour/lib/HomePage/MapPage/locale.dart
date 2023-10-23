import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Filters {
  //List<Marker> _selectedMarkers = [];

  Filters();
  List<Marker> select(String filtrar) {
    switch (filtrar) {
      case "Museus":
        return museus();

      case "Shopping centers":
        return shoppings();
      default:
        return [];
    }
  }

  //List<Marker> get selectedMarkers => _selectedMarkers;

  List<Marker> museus() {
    return [
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-3.7264702, -38.5291793),
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Color.fromARGB(255, 255, 0, 0),
            size: 40.0,
          ),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-3.7343688, -38.4915671),
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Color.fromARGB(255, 255, 0, 0),
            size: 40.0,
          ),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-3.7239821, -38.5235029),
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Color.fromARGB(255, 255, 0, 0),
            size: 40.0,
          ),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-3.7233693, -38.5285794),
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Color.fromARGB(255, 255, 0, 0),
            size: 40.0,
          ),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-3.7674859, -38.4917825),
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Color.fromARGB(255, 255, 0, 0),
            size: 40.0,
          ),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-3.896232, -38.7446388),
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Color.fromARGB(255, 255, 0, 0),
            size: 40.0,
          ),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-3.7214564, -38.5230452),
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Color.fromARGB(255, 255, 0, 0),
            size: 40.0,
          ),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-3.7220845, -38.5330637),
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Color.fromARGB(255, 255, 0, 0),
            size: 40.0,
          ),
        ),
      ),
    ];
  }

  List<Marker> shoppings() {
    return [
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-3.7336906, -38.5159019),
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Color.fromARGB(255, 255, 0, 0),
            size: 40.0,
          ),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-3.7336893, -38.4994217),
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Color.fromARGB(255, 255, 0, 0),
            size: 40.0,
          ),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-3.7547241, -38.5176001),
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Color.fromARGB(255, 255, 0, 0),
            size: 40.0,
          ),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(-3.7536256, -38.6010295),
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Color.fromARGB(255, 255, 0, 0),
            size: 40.0,
          ),
        ),
      ),
    ];
  }
}
