import 'package:corona_check/constant.dart';
import 'package:corona_check/widgets/Button.dart';
import 'package:corona_check/widgets/InputField.dart';
import 'package:corona_check/widgets/counter.dart';
import 'package:corona_check/widgets/myHeader.dart';
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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
          MyHeader(image: "assets/icons/Drcorona.svg" , textTop: "All you need" , textBottom: "is stay at home....",),
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
                buttons(),
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
                          TextSpan(
                              text: "Latest Update of April 18",
                              style: TextStyle(color: kTextLightColor))
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      "See Details",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w600),
                    )
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Counter(
                        color: kInfectedColor,
                        number: 1046,
                        title: "Infected",
                      ),
                      Counter(
                        color: kDeathColor,
                        number: 50,
                        title: "Deaths",
                      ),
                      Counter(
                        color: kRecovercolor,
                        number: 10,
                        title: "Recovered",
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Spread of Virus" , style: kTitleTextstyle,),
                    Text("See Details" , style: TextStyle(color: kPrimaryColor , fontWeight: FontWeight.w600),)
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  padding: EdgeInsets.all(20.0),
                  height: 178,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0) , color: Colors.white , boxShadow: [BoxShadow(offset: Offset(0 , 10 ) , blurRadius: 30.0 , color: kShadowColor)]),
                  child: Image.asset("assets/images/map.png" , fit: BoxFit.contain,),
                )
              ],
            ),
          )
        ],
      ),
      )
    );
  }
}