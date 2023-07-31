import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class CustomMarkerInfoCard extends StatelessWidget {
  final String title;
  final String description;

  CustomMarkerInfoCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class MapComponent extends StatefulWidget {
  MapComponent({Key? key}) : super(key: key);

  @override
  State<MapComponent> createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(6.8031901154223835, 79.91103615863678),
    zoom: 14.4746,
  );
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  Set<Marker> _markers = {};
  void _addMarkers() {
    // Add markers here
    _markers.add(
      Marker(
        markerId: MarkerId('marker_1'),
        position: LatLng(6.8031901154223835, 79.91103615863678),
        infoWindow: InfoWindow(
          title: 'Marker 1 Title',
          snippet: 'Marker 1 Description',
        ),
        onTap: () {
          _onMarkerTapped('marker_1');
        },
      ),
      // Add more markers here...
    );
  }

  void _onMarkerTapped(String markerId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: CustomMarkerInfoCard(
            title: 'Custom Marker Title',
            description: 'Custom Marker Description',
          ),
        );
      },
    );
  }

  final List<String> tabs = [
    'Service centres',
    'Garages',
    'Spare Parts',
    'Vehicle Sales'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            markers: _markers,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) async {
              _controller.complete(controller);
              String style = await DefaultAssetBundle.of(context)
                  .loadString('assets/dark_map.json');
              controller.setMapStyle(style);
            },
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            color:
                Colors.grey[900], // Set the background color of the container
            // opacity: 0.5, // Set the opacity of the container (0.0 to 1.0)
            child: SizedBox(
              height: 100,
              child: Column(
                children: [
                  TextField(
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(1)),
                      border: InputBorder.none,
                    ),
                  ),
                  Container(
                    height: 36, // Set the height of the tabs
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tabs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  20), // Adjust the radius as needed
                              color: _currentIndex == index
                                  ? Color(0xFFEEEEEE)
                                  : Colors.grey[700],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Text(
                                tabs[index],
                                style: TextStyle(
                                  color: _currentIndex == index
                                      ? Colors.black87
                                      : Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
