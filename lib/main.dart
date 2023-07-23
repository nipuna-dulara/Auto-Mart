import 'package:flutter/material.dart';
import 'main/mainView.dart';

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
          brightness: Brightness.dark,
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
                  primary: Colors.green[400],
                  textStyle: TextStyle(color: Colors.lightBlue[900])))),
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

  Widget component() {
    switch (_selectedIndex) {
      case 0:
        return Center(child: Text(_selectedIndex.toString()));
      case 1:
        return DarkThemeCardWithImage(
          imageUrl:
              'https://www.google.com/url?sa=i&url=https%3A%2F%2Fzvelo.com%2Fanatomy-of-full-path-url-hostname-protocol-path-more%2F&psig=AOvVaw01dmEBk8DEzt3TNUDY9hT_&ust=1690223094787000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCNitwuu5pYADFQAAAAAdAAAAABAE',
          cardHeight: 300,
          cardWidth: 410,
        );
      case 2:
        return Center(child: Text(_selectedIndex.toString()));
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
      body: Center(
        child: component(),
      ),
      floatingActionButton: Visibility(
        // visible: _floatinVisibility,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/addpage', arguments: _logged);
          },
          backgroundColor: Colors.grey[600],
          foregroundColor: Colors.black87,
          focusColor: Colors.lightBlue[900],
          child: Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black26,
        selectedItemColor: Colors.grey[600],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Mate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Service',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
