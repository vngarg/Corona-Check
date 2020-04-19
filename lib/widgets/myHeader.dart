import 'package:corona_check/Screens/globalCheck.dart';
import 'package:corona_check/Screens/infoScreen.dart';
import 'package:corona_check/constant.dart';
import 'package:corona_check/main.dart';
import 'package:corona_check/widgets/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHeader extends StatelessWidget {
  final String image, textTop, textBottom, leftIcon, rightIcon;

  const MyHeader({
    Key key,
    this.image,
    this.textTop,
    this.textBottom,
    this.leftIcon,
    this.rightIcon,
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
                          if (leftIcon == "assets/icons/local.svg") {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomeScreen();
                            }));
                          } else if (leftIcon == "assets/icons/symptoms.svg") {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return InfoScreen();
                            }));
                          }
                        },
                        child: SvgPicture.asset(leftIcon))),
                Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                        onTap: () {
                          if (rightIcon == "assets/icons/global.svg") {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CheckGlobal();
                            }));
                          } else if (rightIcon == "assets/icons/symptoms.svg") {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return InfoScreen();
                            }));
                          }
                        },
                        child: SvgPicture.asset(rightIcon))),
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
