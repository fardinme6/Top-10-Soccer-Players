import 'package:flutter/material.dart';

main(){
  var ts = TextStyle(fontSize: 30, color: Colors.white);
  var t = Text("In the name of Allah", style: ts,);
  var tc = Center(child: t,);
  var c = Container(width: 300, height: 200, color: Colors.blue, child: tc,);
  var ce = Center(child: c,);
  var s = Scaffold(body: ce,);
  var ma = MaterialApp(home: s,);
  runApp(ma);
}

