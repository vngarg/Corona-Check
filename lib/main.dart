import 'dart:convert';

import 'package:corona_check/DataLayer%20/Data.dart';
import 'package:corona_check/constant.dart';
import 'package:corona_check/widgets/InputField.dart';
import 'package:corona_check/widgets/counter.dart';
import 'package:corona_check/widgets/myHeader.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<http.Response> makeRequest() async {
    var url =
        "https://covid-19-data.p.rapidapi.com/country?format=json&name=${Info.country.text}";

    final api1Call = await http.get(url, headers: {
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

    setState(() {
      Info.deaths = response1[0]["deaths"];
      Info.recovered = response1[0]["recovered"];
      Info.confirmed = response1[0]["confirmed"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MyHeader(
            image: "assets/icons/Drcorona.svg",
            textTop: "All you need",
            textBottom: "is stay at home....",
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            height: 60.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: Color(0xFFE5E5E5))),
            child: Row(
              children: <Widget>[
                SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: inputField(),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  child: Text('Get Data'),
                  onPressed: () {
                    makeRequest();
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Case Update\n", style: kTitleTextstyle),
                        ],
                      ),
                    ),
                  ],
                ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Counter(
                            color: kInfectedColor,
                            number: Info.confirmed,
                            title: "Infected",
                          ),
                          Counter(
                            color: kDeathColor,
                            number: Info.deaths,
                            title: "Deaths",
                          ),
                        ],
                      ),
                      Counter(
                        color: kRecovercolor,
                        number: Info.recovered,
                        title: "Recovered",
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Spread of Virus",
                style: kTitleTextstyle,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.all(20.0),
            height: 178,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 30.0,
                      color: kShadowColor)
                ]),
            child: Image.asset(
              "assets/images/map.png",
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    ));
  }
}
