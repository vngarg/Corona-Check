import 'dart:convert';

import 'package:corona_check/DataLayer%20/Data.dart';
import 'package:http/http.dart' as http;

Future<http.Response> makeRequest() async {

  var url = "https://covid-19-data.p.rapidapi.com/country?format=json&name=${Info.country.text}";

  final api1Call = await http.get(url , headers: {
    "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
	"x-rapidapi-key": "747dce4abemsh2f1e25b9fc74b4fp10835cjsn4d37437caddf"
  });
  final response1 = jsonDecode(api1Call.body);
  Info.confirmed = response1[0]["confirmed"];
  Info.deaths = response1[0]["deaths"];
  Info.recovered = response1[0]["recovered"];

  print(Info.confirmed);
  print(Info.deaths);
  print(Info.recovered);

}