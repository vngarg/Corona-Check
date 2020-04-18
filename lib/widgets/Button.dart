import 'package:corona_check/BackEnd/getData.dart';
import 'package:flutter/material.dart';

Widget buttons() {
  return Container(
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
      child: Text('Get Data'),
      onPressed: () {
        makeRequest();
      },
    ),
  );
}
