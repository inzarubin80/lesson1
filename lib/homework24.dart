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
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              "Wheather",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(onPressed: null, icon: Icon(Icons.menu)),
            iconTheme: IconThemeData(color: Colors.black54),
            brightness: Brightness.light,
            actions: [IconButton(onPressed: null, icon: Icon(Icons.settings))],
          ),
          body: _buildBody()),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: SafeArea(
      child: Column(
        children: [
          _headerImage(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _wheaterDescription(),
                  Divider(),
                  _temperature(),
                  Divider(),
                  _TemperatureForecast(),
                  Divider(),
                  _futerRetings()
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Image _headerImage() {
  return Image(
      image: NetworkImage(
          'https://iforum-ru.c.hihonor.com/ru_data/images/2020/9/19/f4a60673-4af8-42c0-9dd5-96b0405d5dcb.jpg'));
}

Column _wheaterDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('Tuesday - May 22',
          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
      Divider(),
      Text(
          'В Лобне на сегодня, точный прогноз погоды на сегодня для населенного пункта Лобня, Лобня (городской округ), Московская область',
          style: TextStyle(color: Colors.black54)),
    ],
  );
}

Row _temperature() {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
    Column(children: <Widget>[
      Icon(
        Icons.wb_sunny,
        color: Colors.yellow,
      ),
    ]),
    SizedBox(
      width: 20,
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Text(
              "15 °C",
              style: TextStyle(color: Colors.deepPurple),
            )
          ],
        ),
        Row(
          children: [
            Text(
              "Московская область г.Лобня",
              style: TextStyle(color: Colors.grey),
            )
          ],
        )
      ],
    ),
  ]);
}

Wrap _TemperatureForecast() {
  return Wrap(
      spacing: 10.0,
      children: List.generate(
          7,
          (int index) => Chip(
                label: Text(
                  '${index + 20} °C',
                  style: TextStyle(fontSize: 15.0),
                ),
                avatar: Icon(
                  Icons.wb_cloudy,
                  color: Colors.blue.shade300,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: BorderSide(color: Colors.grey)),
                backgroundColor: Colors.grey.shade100,
              )));
}

Row _futerRetings() {
  var stars = Row(
    children: <Widget>[
      Icon(Icons.star, size: 20.0, color: Colors.yellow[600],),
      Icon(Icons.star, size: 20.0, color: Colors.yellow[600],),
      Icon(Icons.star, size: 20.0, color: Colors.yellow[600],),
      Icon(Icons.star, size: 20.0, color: Colors.black,),
      Icon(Icons.star, size: 20.0, color: Colors.black,),
      


    ],
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text(
        'Info with open.org',
        style: TextStyle(fontSize: 15),
      ),
      stars,
      
    ],
  );
}
