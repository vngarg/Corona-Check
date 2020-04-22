import 'package:corona_check/Screens/globalCheck.dart';
import 'package:corona_check/Screens/infoScreen.dart';
import 'package:corona_check/constant.dart';
import 'package:corona_check/main.dart';
import 'package:corona_check/widgets/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHeader extends StatelessWidget {
  final String image, textTop, textBottom;
  final int data;

  const MyHeader({
    Key key,
    this.image,
    this.data,
    this.textTop,
    this.textBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFF3383CD), Color(0xFF11249F)]),
            image:
                DecorationImage(image: AssetImage("assets/images/virus.png"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                        onTap: () {
                          data == 1 ? {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return InfoScreen();
                              },
                            ),
                          )
                          }
                           : {
                             Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomeScreen();
                              },
                            ),
                          )
                           };
                        },
                        child: SvgPicture.asset("assets/icons/menu.svg"))),
              ],
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Stack(
                children: <Widget>[
                  SvgPicture.asset(
                    image,
                    width: 230.0,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                    top: 20.0,
                    left: 150.0,
                    child: Text("$textTop \n$textBottom",
                        style: kHeadingTextStyle.copyWith(color: Colors.white)),
                  ),
                  Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
