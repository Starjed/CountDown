import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({Key? key}) : super(key: key);

  @override
  _StopWatchScreen createState() => _StopWatchScreen();
}

class _StopWatchScreen extends State<StopWatchScreen> {
  static const countDownDuration = Duration(minutes: 0);
  Duration duration = Duration();
  Timer? timer;

  bool isCountdown = false;

  @override
  void initState() {
    super.initState();

    reset();
  }

  void reset() {
    if (isCountdown) {
      setState(() => duration = countDownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer() {
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(child: buildTime()),
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    const size = SizedBox(width: 8, height: 100);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTimeCard(time: hours, header: 'HOURS'),
            const SizedBox(width: 8),
            buildTimeCard(time: minutes, header: 'MINUTES'),
            const SizedBox(width: 8),
            buildTimeCard(time: seconds, header: 'SECONDS'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            size,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green
              ),
              child: const Text('Start'),
              onPressed: () {
                setState(() {
                  startTimer();
                });
              },
            ),
            size,
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.yellowAccent
                ),
              child: const Text('Stop'),
              onPressed: () {
                  setState(() {
                    stopTimer();
                  });
                }
            ),
            size,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.red
              ),
              child: const Text('Reset'),
              onPressed: () {
                setState(() {
                  stopTimer();
                  reset();
                });
              },
            ),
          ],
        )
      ],
    );
  }

  buildTimeCard({required String time, required String header}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            time,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 72,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(header),
      ],
    );
  }
}
