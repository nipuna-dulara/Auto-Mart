import 'package:flutter/material.dart';

class DarkThemeCardWithImage extends StatelessWidget {
  final String imageUrl;
  final double cardWidth;
  final double cardHeight;
  final String vehicleType;
  final String numberPlate;
  final String warning;
  final bool addNew;

  DarkThemeCardWithImage({
    required this.imageUrl,
    required this.cardWidth,
    required this.cardHeight,
    required this.numberPlate,
    required this.vehicleType,
    required this.warning,
    required this.addNew,
  });

  @override
  Widget build(BuildContext context) {
    var Content = Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 12),
          Text(
            vehicleType,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            numberPlate,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            warning,
            style: TextStyle(
              color: Colors.yellow[400],
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Image.asset(
              // Use Image.asset instead of Image.network
              imageUrl, // The path to the image asset (e.g., 'assets/Prius.png')
              fit: BoxFit.cover,
              height: 150,

              width: 150,
            ),
          )
        ],
      ),
    );
    var AddNew = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // Add your logic for the "Add New" button here
            },
            child: Text("Add New"),
          ),
        ],
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: SizedBox(
        width: cardWidth, // Set the desired width for the card
        height: cardHeight, // Set the desired height for the card
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.grey[850],
          child: Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Colors.grey[850]!,
                  width: 2.0,
                ),
                // ? Border.all(
                //     color: Colors.grey[850]!,
                //     width: 2.0,
                //   )
                // : Border.fromBorderSide(BorderSide.none),
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.grey[900]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: addNew ? AddNew : Content,
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBarWithButton extends StatefulWidget {
  @override
  _SearchBarWithButtonState createState() => _SearchBarWithButtonState();
}

class _SearchBarWithButtonState extends State<SearchBarWithButton> {
  TextEditingController _searchController = TextEditingController();
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
  }

  void _onSearchTextChanged() {
    setState(() {
      _showClearButton = _searchController.text.isNotEmpty;
    });
  }

  void _onClearButtonPressed() {
    setState(() {
      _searchController.clear();
      _showClearButton = false;
    });
  }

  void _onSearchButtonPressed() {
    // Handle the search button press here
    String searchText = _searchController.text;
    print("Searching for: $searchText");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                  ),
                ),
              ),
              if (_showClearButton)
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: _onClearButtonPressed,
                ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: _onSearchButtonPressed,
              ),
            ],
          ),
        ),
        // Add other widgets here
      ],
    );
  }
}
