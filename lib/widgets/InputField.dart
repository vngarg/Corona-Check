import 'package:corona_check/DataLayer%20/Data.dart';
import 'package:flutter/material.dart';

Widget inputField() {

  // Info.country = TextEditingController();

  return Container(
    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
    child: TextFormField(
      onChanged: (text) {
        Info.country = text;
  },
      // controller: Info.country,
      decoration: InputDecoration(
        hintText: 'Enter Country',
      ),
      textAlign: TextAlign.center,
    ),
  );
}
