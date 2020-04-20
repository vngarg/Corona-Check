import 'dart:convert';

import 'package:corona_check/constant.dart';
import 'package:corona_check/widgets/counter.dart';
import 'package:corona_check/widgets/myHeader.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid 19',
        theme: ThemeData(
            scaffoldBackgroundColor: kBackgroundColor,
            fontFamily: "Poppins",
            textTheme: TextTheme(body1: TextStyle(color: kBodyTextColor))),
        home: CheckGlobal());
  }
}

class CheckGlobal extends StatefulWidget {
  @override
  _CheckGlobalState createState() => _CheckGlobalState();
}

class _CheckGlobalState extends State<CheckGlobal> {
  var country , value=0;
  var total, deaths, recovered;

  countries(country) {
    makeRequest(country);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 30.0,
                      color: kShadowColor)
                ]),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "$country\n", style: kTitleTextstyle),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Counter(
                      color: kInfectedColor,
                      number: total,
                      title: "Infected",
                    ),
                    Counter(
                      color: kDeathColor,
                      number: deaths,
                      title: "Deaths",
                    ),
                  ],
                ),
                Counter(
                  color: kRecovercolor,
                  number: recovered,
                  title: "Recovered",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<http.Response> makeRequest(country) async {

    if(value<3) {
      print("BEFORE URL.............");
      var url =
        "https://covid-19-data.p.rapidapi.com/country?format=json&name=$country";
      print("AFTER URL................ $country");
    final api1Call = await http.get(url, headers: {
      "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
      "x-rapidapi-key": "747dce4abemsh2f1e25b9fc74b4fp10835cjsn4d37437caddf"
    });
    final response1 = jsonDecode(api1Call.body);
    print("BEFORE SETSTATE................");
    setState(() {
    total = response1[0]["confirmed"];
    deaths = response1[0]["deaths"];
    recovered = response1[0]["recovered"];
    });
    print("AFTER SETSTATE.................");
    ++value;

    print(country);
    print(total);
    print(deaths);
    print(recovered);
    print(value);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MyHeader(
            leftIcon: "assets/icons/local.svg",
            rightIcon: "assets/icons/symptoms.svg",
            image: "assets/icons/Drcorona.svg",
            textTop: "All you need",
            textBottom: "is stay at home....",
          ),
          countries("USA"),
          countries("Spain"),
          countries("Italy"),
          countries("France"),
          countries("Germany"),
          countries("UK"),
          countries("China"),
          countries("Turkey"),
          countries("Iran"),
          countries("Russia"),
        ],
      ),
    ));
  }
}
