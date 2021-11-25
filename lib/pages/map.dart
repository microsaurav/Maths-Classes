import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:singuplogin/pages/books.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  late BitmapDescriptor mapMarker;
  Set<Marker> _markers = {};
  Set<Circle> _circles = HashSet<Circle>();

  @override
  void initState() {
    super.initState();
    _setCircles();
  }

  // void setCustomMarker() async {
  //   mapMarker = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration(), 'assets/pic3.png');
  // }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId('id-1'),
            position: LatLng(26.131628, 85.396565),
            // icon: mapMarker,
            infoWindow: InfoWindow(
                title: 'D.L Das Maths Classes',
                snippet: 'Maths Coaching Institute')),
      );
    });
  }

  void _setCircles() {
    _circles.add(
      Circle(
          circleId: CircleId("0"),
          center: LatLng(26.131628, 85.396565),
          radius: 5,
          strokeWidth: 2,
          fillColor: Color.fromRGBO(102, 51, 153, .5)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Map', style: TextStyle(fontSize: 23.0)),
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Book()),
                  );
                })),
        body: GoogleMap(
            onMapCreated: _onMapCreated,
            markers: _markers,
            circles: _circles,
            initialCameraPosition: CameraPosition(
                target: LatLng(26.131628, 85.396565), zoom: 40)));
  }
}
