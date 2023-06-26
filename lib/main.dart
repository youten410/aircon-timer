import 'package:flutter/material.dart';
import 'dart:async'; // 追加

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AirConTimer(),
    );
  }
}

class AirConTimer extends StatefulWidget {
  const AirConTimer({Key? key}) : super(key: key);

  @override
  State<AirConTimer> createState() => _AirConTimerState();
}

class _AirConTimerState extends State<AirConTimer> {
  //選択された時刻
  TimeOfDay selectedTime = TimeOfDay.now();
  //現在時刻
  TimeOfDay nowTime = TimeOfDay.now();
  //
  Timer? timer;

  //時間差
  Duration timeDifference = Duration.zero;

  @override
  void initState() {
    super.initState();

    // 追加: 初期化時に現在時刻を1秒ごとに更新するTimerを設定
    timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer t) => setState(() {
        nowTime = TimeOfDay.now();
      }),
    );
  }

  @override
  void dispose() {
    // 追加: Timerを破棄
    timer?.cancel();
    super.dispose();
  }

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
              // 変更: 現在時刻を表示
              '${nowTime.hour.toString().padLeft(2, "0")}:${nowTime.minute.toString().padLeft(2, "0")}',
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
              '${selectedTime.hour.toString().padLeft(2, "0")}:${selectedTime.minute.toString().padLeft(2, "0")}',
              style: TextStyle(fontSize: 40.0),
            ),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: const Text('時刻選択'),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "${timeDifference.inHours.toString().padLeft(2, "0")}時間${(timeDifference.inMinutes % 60).toString().padLeft(2, "0")}分",
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

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.input,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
        calculateTimeDifference();
      });
    }
  }

  void calculateTimeDifference() {
    final nowDateTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, nowTime.hour, nowTime.minute);
    final selectedDateTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, selectedTime.hour, selectedTime.minute);
    timeDifference = selectedDateTime.difference(nowDateTime);

    if (timeDifference.isNegative) {
      timeDifference += Duration(hours: 24);
    }
  }
}
