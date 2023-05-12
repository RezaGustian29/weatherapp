import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/screen/weather/weather_details_screen.dart';
import 'package:weatherapp/screen/weather/weather_screen.dart';

class WeatherSavePage extends StatefulWidget {
  WeatherSavePage({super.key, required this.title, required this.item});
  final String title;
  final Map<String, dynamic> item;

  @override
  _WeatherSavePageState createState() => _WeatherSavePageState();
}

class _WeatherSavePageState extends State<WeatherSavePage> {
  String description = '';
  String name = '';

  @override
  void initState() {
    super.initState();
    // Mengambil data dari SharedPreferences saat widget diinisialisasi
    getData();
  }

  void getData() async {
    // Mengambil SharedPreferences instance
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Mengambil data yang disimpan dari SharedPreferences
    setState(() {
      description = prefs.getString('description') ?? '';
      name = prefs.getString('name') ?? '';
    });
  }

  void navigateToDetailPage(item) {
    // Navigasi ke halaman detail cuaca
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WeatherDetails(
            title: item['description'].toString(),
            headerInfo: item['name'],
            infoData: item['parameter']),
      ),
    );
  }

  /*  Widget navigateToDetailPage(item) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => WeatherDetails(
                  title: item['description'],
                  headerInfo: item['name'],
                  infoData: item['parameter'],
                ))));
      },
    );
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Save'),
      ),
      body: Card(
        child: ListTile(
          title: Text(description),
          subtitle: Text(name),
          onTap: () {
            navigateToDetailPage(widget.item);
          },
          trailing: IconButton(
            onPressed: () async {
              // Mengambil SharedPreferences instance
              SharedPreferences prefs = await SharedPreferences.getInstance();

              // Menghapus data dari SharedPreferences
              prefs.remove('description');
              prefs.remove('name');

              // Menampilkan snackbar untuk memberi tahu pengguna bahwa data berhasil dihapus
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Data berhasil dihapus')),
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WeatherScreen(
                title: '',
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
