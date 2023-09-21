import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar  extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Countdown"),
      ),
      body:  const Center(
        child: Text(
        "My body"
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: const Color(0xFF526480),
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.access_alarms_outlined), label: "Timer"),
        BottomNavigationBarItem(icon: Icon(Icons.date_range), label: "Calendar")
      ],),
    );
  }
}
