import 'package:flutter/material.dart';

var count = 0;
main() {
  runApp(
    MaterialApp(
      home: MyApp()
    ),
  );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[900],
        title: Text(
          "Counter App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
          child: Text(
            count.toString(),
            style: TextStyle(fontSize: 40),
          )),
      floatingActionButton:
      FloatingActionButton(onPressed: (){
        setState(() {
        count++;
        });
      }, child: Icon(Icons.add)),
    );
  }
}
