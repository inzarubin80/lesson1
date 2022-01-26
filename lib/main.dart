import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text("Открываем мир"),
          centerTitle: true,
        ),
        body: const Center(
            child: Text(
          "Привет мир!!!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    ),
  );
}
