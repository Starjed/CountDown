import 'package:flutter/material.dart';

class StopWatch extends StatelessWidget {
  const StopWatch({Key? key}) : super(key: key);
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stop Watch'),
        centerTitle: true,
        backgroundColor: Color(0xFF48C4FA),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snapshopt) {
                final value = snapshopt.data;
                final displayTime = StopWatchTimer.getDisplayTime(value, hours: _isHours);
                  return Text(
                      displayTime,
                    style: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                    ),
                  )
            })
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Color color;
  final Function onPress;
  final String label;

  CustomButton({this.color, this.onPress, this.label});

  @override
  Widget build(BuildContext context) {
    return RaisedButton (
      color: color,
      shape: const StadiumBorder(),
      onPressed: onPress,
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
    )
    )
    )
  }
}
