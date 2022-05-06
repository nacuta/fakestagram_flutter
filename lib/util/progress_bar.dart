import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyProgresBar extends StatefulWidget {
  double percentWatched = 0;
  MyProgresBar({Key? key, required this.percentWatched}) : super(key: key);

  @override
  State<MyProgresBar> createState() => _MyProgresBarState();
}

class _MyProgresBarState extends State<MyProgresBar> {
  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 15,
      percent: widget.percentWatched,
      progressColor: Colors.grey[400],
      backgroundColor: Colors.grey[600],
    );
  }
}
