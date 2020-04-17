import 'package:corona_check/constant.dart';
import 'package:corona_check/widgets/myHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyHeader(
            image: "assets/icons/coronadr.svg",
            textTop: "Get to know",
            textBottom: "About Covid-19",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Symptoms",
                  style: kTitleTextstyle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SymptomCard(
                      image: "assets/images/headache.png",
                      title: "Headache",
                      isActive: true,
                    ),
                    SymptomCard(
                      image: "assets/images/caugh.png",
                      title: "Cough",
                    ),
                    SymptomCard(
                      image: "assets/images/fever.png",
                      title: "Fever",
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Prevention",
                  style: kTitleTextstyle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                PreventCard(
                    image: "assets/images/wear_mask.png",
                    title: "Wear Face Mask",
                    text:
                        "Since the start of CoronaVirus outbreak some places have fully embraced wearing masks...."),
                PreventCard(
                    image: "assets/images/wash_hands.png",
                    title: "Wash Your Hands",
                    text:
                        "Since the start of CoronaVirus outbreak some places have fully embraced wearing masks...."),
                SizedBox(height: 25.0,)
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class PreventCard extends StatelessWidget {
  final String image, title, text;

  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        height: 156.0,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 24.0,
                        color: kShadowColor)
                  ]),
            ),
            Image.asset(image),
            Positioned(
              left: 130.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                height: 156.0,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      text,
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset("assets/icons/forward.svg"))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image, title;
  final bool isActive;

  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: [
            isActive
                ? BoxShadow(
                    offset: Offset(0, 16),
                    blurRadius: 52.0,
                    color: kActiveShadowColor)
                : BoxShadow(
                    offset: Offset(0, 3), blurRadius: 6, color: kShadowColor)
          ]),
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: 90.0,
          ),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
