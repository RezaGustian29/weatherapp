import 'package:flutter/material.dart';
import 'package:weatherapp/model/api/weather_api.dart';
import 'package:weatherapp/screen/weather/weather_detail_save_screen.dart';
import 'package:weatherapp/screen/weather/weather_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

/* class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final List<dynamic> _searchResult = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<WeatherViewModel>(context, listen: false).gettAllWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelview = Provider.of<WeatherViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeatherApp'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const WeatherSearch())),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: modelview.weathers.length,
        itemBuilder: (context, index) {
          final weather = modelview.weathers[index];
          return Card(
            child: ListTile(
              title: Text(weather.propinsi),
              subtitle: Text(weather.kota),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
        );
      }),
    );
  }
} */

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, required this.title});
  final String title;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController searchController = TextEditingController();
  String textSearch = '';

  Widget buildListKota(item) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => WeatherDetails(
                  title: item['description'],
                  headerInfo: item['name'],
                  infoData: item['parameter'],
                ))));
      },
      child: Card(
        child: ListTile(
          title: Text(item['description']),
          subtitle: Text(item['name'][1]['\$t'].toString()),
          trailing: IconButton(
            onPressed: () async {
              // Mengambil SharedPreferences instance
              SharedPreferences prefs = await SharedPreferences.getInstance();

              // Menambahkan data dari card ke SharedPreferences
              prefs.setString('description', item['description']);
              prefs.setString('name', item['name'][1]['\$t'].toString());

              // Menampilkan snackbar untuk memberi tahu pengguna bahwa data berhasil disimpan
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Data berhasil disimpan')),
              );
            },
            icon: Icon(Icons.bookmark_add),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.lightBlue,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    textSearch = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Cari disini ...',
                  suffixIcon: Icon(Icons.search),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.white10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.white38),
                  ),
                ),
              ),
            ),
            Container(
              height: 20,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.8, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: fetchDataBMKG(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  if (snapshot.hasData) {
                    List<dynamic> datakota = snapshot.data;
                    if (textSearch.isNotEmpty) {
                      datakota = datakota.where((element) {
                        return element['description']
                            .toString()
                            .toLowerCase()
                            .contains(textSearch.toString().toLowerCase());
                      }).toList();
                    }
                    return ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: datakota.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = datakota[index];
                          return buildListKota(item);
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
