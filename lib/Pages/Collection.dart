import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController; // Remplacé par une variable nullable

 static final CameraPosition _kGooglepex = CameraPosition(
    target: LatLng(37.42796133588664, -122.8857496),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carte Google Maps'),
        backgroundColor: Color(0xFF114521),
      ),
      body: GoogleMap(initialCameraPosition: _kGooglepex,
      mapType: MapType.hybrid,)
    );
  }
}
