/* import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _textEditingController = TextEditingController();
  List<dynamic> _searchResult = [];

  void _searchCity(String query) async {
    String apiUrl = 'https://ibnux.github.io/BMKG-importer/cuaca/wilayah.json';
    final response = await http.get(Uri.parse(apiUrl));
    final data = json.decode(response.body);

    setState(() {
      _searchResult = data.where((item) {
        var itemName = item['kota'].toString().toLowerCase();
        return itemName.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Search for a city',
              ),
              onChanged: (value) {
                _searchCity(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResult.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_searchResult[index]['kota']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}






/* import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherSearch extends StatefulWidget {
  const WeatherSearch({super.key});

  @override
  State<WeatherSearch> createState() => _WeatherSearchState();
}

class _WeatherSearchState extends State<WeatherSearch> {
  /* final TextEditingController _textEditingController = TextEditingController();
  List<dynamic> _searchResult = [];

  void _searchCity(String query) async {
    String apiUrl = "https://ibnux.github.io/BMKG-importer/cuaca/wilayah.json";
    final response = await http.get(Uri.parse(apiUrl));
    final data = json.decode(response.body);

    setState(() {
      _searchResult = data.where((item) {
        var itemName = item['kota'].toString().toLowerCase();
        return itemName.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                    _textEditingController.clear();
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                _searchCity(value);
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _searchResult.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_searchResult[index]['kota']),
                );
              },
            ),
          ),
        ],
      ),
    );
  } */

  final TextEditingController _textEditingController = TextEditingController();
  List<dynamic> _searchResult = [];

  void _searchCity(String query) async {
    String apiUrl = 'https://ibnux.github.io/BMKG-importer/cuaca/wilayah.json';
    final response = await http.get(Uri.parse(apiUrl));
    final data = json.decode(response.body);

    setState(() {
      _searchResult = data.where((item) {
        var itemName = item['kota'].toString().toLowerCase();
        return itemName.contains(query.toLowerCase());
      }).toList();
    });
  }

  void _navigateToDetail(BuildContext context, dynamic item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CityDetailPage(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Search for a city',
              ),
              onChanged: (value) {
                _searchCity(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResult.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_searchResult[index]['kota']),
                  onTap: () {
                    _navigateToDetail(context, _searchResult[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CityDetailPage extends StatelessWidget {
  final dynamic item;

  CityDetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['kota']),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Provinsi: ${item['propinsi']}'),
            Text('Latitude: ${item['lat']}'),
            Text('Longitude: ${item['lon']}'),
          ],
        ),
      ),
    );
  }
} */
 */