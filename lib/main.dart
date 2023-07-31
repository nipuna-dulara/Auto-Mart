import 'package:flutter/material.dart';
import 'main/search.dart';
import 'main/carCard.dart';
import 'icons/my_flutter_app_icons.dart';
import 'main/service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.grey[900],
          primaryColor: Colors.black87,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.lightBlue[900],
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.lightBlue[900],
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey[850],
                  textStyle: TextStyle(color: Colors.grey[400])))),
      initialRoute: '/',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;
  bool _floatinVisibility = true;
  bool? _logged;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _openDrawer() {
    // To open the drawer, use the ScaffoldState's openDrawer() method.
    // We can access the ScaffoldState using the _scaffoldKey.
    _scaffoldKey.currentState!.openDrawer();
  }

  Widget component() {
    switch (_selectedIndex) {
      case 0:
        return Center(child: Text(_selectedIndex.toString()));
      case 1:
        return SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors
                          .black26, // Specify the color of the bottom border
                      width: 1.0, // Specify the width of the bottom border
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    SB(), // Your SB component here
                    SizedBox(
                        width: 8), // Adjust the spacing between SB and the icon
                    GestureDetector(
                      onTap: () {
                        // Add your onPressed logic here
                        _openDrawer();
                      },
                      child: Icon(
                        Icons.blur_on_sharp,
                        color: Colors.grey[400],
                        size: 35,
                      ),
                    ),
                  ],
                ),
                height: 58,
              ),
              Expanded(
                  child: SafeArea(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[
                              900], // Background color of the rounded rectangle
                          borderRadius: BorderRadius.circular(
                              16), // Rounded corners for the rectangle
                          border: Border.all(
                            color: Colors.black26, // Border color
                            width: 1.5, // Border width
                          ),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 32, // Radius of the circle avatar
                              backgroundImage: AssetImage(
                                  'assets/your_image.png'), // Your rounded image
                            ),
                            SizedBox(
                                width:
                                    16), // Add spacing between the image and the name
                            Column(
                              children: [
                                Text(
                                  'Good Morning',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500]),
                                ),
                                Text(
                                  'Tharusha wijewardhene',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    DarkThemeCardWithImage(
                      imageUrl: 'assets/lambo.png',
                      cardHeight: 330,
                      cardWidth: 410,
                      vehicleType: "Lambogini",
                      addNew: false,
                      numberPlate: "CAB-9080",
                      warning: "Brakes may fail",
                    ),
                    DarkThemeCardWithImage(
                      imageUrl: 'assets/rangerover.png',
                      cardHeight: 330,
                      cardWidth: 410,
                      vehicleType: "range rover",
                      numberPlate: "CBD-7858",
                      addNew: false,
                      warning: "service overdue",
                    ),
                    DarkThemeCardWithImage(
                      imageUrl: 'assets/lambo.png',
                      addNew: false,
                      cardHeight: 330,
                      cardWidth: 410,
                      vehicleType: "Lambogini",
                      numberPlate: "CAB-9080",
                      warning: "Brakes may fail",
                    ),
                    DarkThemeCardWithImage(
                      imageUrl: 'assets/lambo.png',
                      addNew: true,
                      cardHeight: 330,
                      cardWidth: 410,
                      vehicleType: "Lambogini",
                      numberPlate: "CAB-9080",
                      warning: "Brakes may fail",
                    ),
                  ],
                ),
              ))
            ],
          ),
        );

      case 2:
        return MapComponent();
      default:
        return Center(child: Text(_selectedIndex.toString()));
    }
  }

  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: component(),

      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Container(
          color: Colors.grey[400],
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black87,
                ),
                child: Text('Auto Mate',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    )),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: Visibility(
      //   // visible: _floatinVisibility,
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       Navigator.of(context).pushNamed('/addpage', arguments: _logged);
      //     },
      //     backgroundColor: Colors.grey[600],
      //     foregroundColor: Colors.black87,
      //     focusColor: Colors.lightBlue[900],
      //     child: Icon(Icons.add),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.grey[400],
        unselectedItemColor: Colors.grey[600],
        iconSize: 40.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.shop),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.group_1),
            label: 'Mate',
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.wrench),
            label: 'Service',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
