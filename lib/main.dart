import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_dice/dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Dice dice = Dice(size: 100);
  late Timer timer;
  int resultNum = 0;

  void start() {
    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      dice.shack();
      setState(() {
        resultNum = dice.dice[0];
      });
      print(dice.pick());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Flexible(
                flex: 2,
                child: Center(
                  child: Text('$resultNum', style: TextStyle(fontSize: 60)),
                )),
            Flexible(
                flex: 1,
                child: Center(
                  child: Text('결과', style: TextStyle(fontSize: 20)),
                )),
            Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        iconSize: 100,
                        onPressed: start,
                        icon: Icon(
                          Icons.play_circle_fill_outlined,
                        )),
                    IconButton(
                        iconSize: 100,
                        onPressed: () {},
                        icon: Icon(
                          Icons.check_box_outlined,
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
