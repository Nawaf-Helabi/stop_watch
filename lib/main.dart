// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: StopWatch(),
    );
  }
}

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  // int second = 0;
  // int minute = 0;
  // int hour = 0;
  Duration duration = Duration(seconds: 0);

  Timer? stop;
  bool isRunning = false;
  int newsecond = 0;
  startTimer() {
    stop = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        newsecond = duration.inSeconds + 1;
        duration = Duration(seconds: newsecond);
        //  if (second==60) {
        //   minute+=1;
        //   second=0;

        //  } else {second++;

        //  }
        //   if (minute==60) {
        //   hour+=1;
        //   minute=0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                      child: Text(
                        duration.inHours.toString().padLeft(2, "0"),
                        // hour.toString().padLeft(2, '0'),
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Hours',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                      child: Text(
                        duration.inMinutes
                            .remainder(60)
                            .toString()
                            .padLeft(2, "0"),
                        // minute.toString().padLeft(2, '0'),
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Minutes',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                      child: Text(
                        duration.inSeconds
                            .remainder(60)
                            .toString()
                            .padLeft(2, "0"),
                        // second.toString().padLeft(2, '0'),
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'second',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            isRunning
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (stop!.isActive) {
                                setState(() {
                                  stop!.cancel();
                                });
                              } else {
                                startTimer();
                              }
                            },
                            child: Text(
                              (stop!.isActive)
                                  ? '  Stop timer  '
                                  : 'Resume timer',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          stop!.cancel();
                          setState(() {
                            isRunning = false;
                            duration = Duration(seconds: 0);
                          });
                        },
                        child: Text(
                          'Cancel timer',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.redAccent)),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      startTimer();
                      setState(() {
                        isRunning = true;
                      });
                    },
                    child: Text(
                      'Start timer',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.blueAccent)),
                  ),
          ],
        ),
      ),
    );
  }
}
