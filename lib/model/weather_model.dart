class Weather {
  final int id;
  final String propinsi;
  final String kota;
  final String kecamatan;
  final double lat;
  final double lon;

  Weather(
      {required this.id,
      required this.propinsi,
      required this.kota,
      required this.kecamatan,
      required this.lat,
      required this.lon});
}
