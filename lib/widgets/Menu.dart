import 'package:flutter/material.dart';

Widget drawerMenu(context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    ),
  );
}
