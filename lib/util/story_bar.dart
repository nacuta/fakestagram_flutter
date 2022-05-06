import 'package:flutter/material.dart';

import 'progress_bar.dart';

class MyStoryBar extends StatefulWidget {
  MyStoryBar({Key? key, required this.percentWatched}) : super(key: key);
  List<double> percentWatched = [];

  @override
  State<MyStoryBar> createState() => _MyStoryBarState();
}

class _MyStoryBarState extends State<MyStoryBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 60, 8, 0),
      child: Row(
        children: [
          Expanded(
            child: MyProgresBar(
              percentWatched: widget.percentWatched[0],
            ),
          ),
          Expanded(
            child: MyProgresBar(
              percentWatched: widget.percentWatched[1],
            ),
          ),
          Expanded(
            child: MyProgresBar(
              percentWatched: widget.percentWatched[2],
            ),
          ),
        ],
      ),
    );
  }
}
