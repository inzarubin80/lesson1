import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFirstApp();
  }
}

class _MyFirstApp extends State<MyFirstApp> {

  bool _loading = false;
  double _progress = 0;
  initState() {}

  void updateProgress() {
    const oneSec =  Duration(microseconds: 100000);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_progress >= 100) {
          setState(() {
            timer.cancel();
            setState(() {
              _loading = false;
              _progress = 0;
            });
          });
        } else {
          setState(() {
            _progress++;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          title: const Text("Загрузка файлов "),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
              padding: const EdgeInsets.all(16),
              child: _loading
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        LinearProgressIndicator(
                          value: _progress/100,
                        ),
                        Text(
                           '$_progress %',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    )
                  : const Text(
                      "Press button to download",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _loading = true;
              updateProgress();
            });
          },
          child: Icon(Icons.cloud),
        ),
      ),
    );
  }
}
