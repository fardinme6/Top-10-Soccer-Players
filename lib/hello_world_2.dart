import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          color: Colors.blue,
          child: Center(
            child: Text(
              "In the name of Allah",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
      ),
    ),
  ));
}
