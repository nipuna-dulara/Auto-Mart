import 'package:flutter/material.dart';

class SB extends StatefulWidget {
  @override
  _SBState createState() => _SBState();
}

class _SBState extends State<SB> {
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
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    style: TextStyle(
                      // Set the font size and color for the text in the TextField
                      fontSize: 28, // Adjust the font size as needed
                      color: Colors.white, // Change the color to white
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.7)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if (_showClearButton)
                  IconButton(
                    icon: Icon(Icons.clear, size: 35),
                    onPressed: _onClearButtonPressed,
                    color: Colors.white.withOpacity(0.8),
                  ),
                // IconButton(
                //   icon: Icon(Icons.search, size: 35),
                //   onPressed: _onSearchButtonPressed,
                //   color: Colors.white.withOpacity(0.8),
                // ),
              ],
            ),
          ),
          // Add other widgets here
        ],
      ),
    );
  }
}
