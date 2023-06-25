import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AirConTimer(),
    );
  }
}

class AirConTimer extends StatefulWidget {
  const AirConTimer({super.key});

  @override
  State<AirConTimer> createState() => _AirConTimerState();
}

class _AirConTimerState extends State<AirConTimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "現在の時刻",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "23:30",
              style: TextStyle(fontSize: 40.0),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "ON/OFFにしたい時刻",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "6:00",
              style: TextStyle(fontSize: 40.0),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "何時間後？",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "6.5時間",
              style: TextStyle(fontSize: 40.0),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "エアコンの温度は〇℃がエコです🌏",
              style: TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
