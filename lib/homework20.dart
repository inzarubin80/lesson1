import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(fontFamily: 'IndieFlower'),
      home: Scaffold(
          backgroundColor: Colors.cyan,
          appBar: AppBar(
            title: const Text("Counter"),
            centerTitle: true,
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Tap  \"-\" to decrement",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              counteWidget(),
              Text(
                "Tap  \"+\" to increment",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ))),
    );
  }
}

class counteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return counteWidgetState();
  }
}

class counteWidgetState extends State<StatefulWidget> {
  int _count = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(8),
        ),
        width: 120,
        margin: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.remove),
              color: Colors.black,
              onPressed: () {
                setState(() {
                  _count--;
                });
              },
            ),
            Text(
              "$_count",
              style: TextStyle(color: Colors.black),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              color: Colors.black,
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
            ),
          ],
        ));
  }
}
