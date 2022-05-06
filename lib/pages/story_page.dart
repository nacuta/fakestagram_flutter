import 'dart:async';

import 'package:flutter/material.dart';

import '../stories/story1.dart';
import '../stories/story2.dart';
import '../stories/story3.dart';
import '../util/story_bar.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int currentIndexStory = 0;
  List<Widget> myStories = [
    const MyStory1(),
    const MyStory2(),
    const MyStory3(),
  ];
  List<double> percentWatched = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < myStories.length; i++) {
      percentWatched.add(0);
    }
    _startWatching();
  }
  @override
  void dispose() {
    for (int i = 0; i < myStories.length; i++) {
      percentWatched.remove(0);
    }
      _startWatching();
    super.dispose();
  }
  void _startWatching() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        // only add 0.01 as long is below 1;
        if (percentWatched[currentIndexStory] + 0.1 < 1) {
          percentWatched[currentIndexStory] += 0.1;
        } else {
          // if adding 0.01 exceedes 1 then percentWatched is 1 and cancel timer
          percentWatched[currentIndexStory] = 1;
          timer.cancel();

          // if is another story go to next
          if (currentIndexStory < myStories.length - 1) {
            currentIndexStory++;
            _startWatching();
          } else {
            // if last story return
            Navigator.pop(context);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapDown(details),
      child: Scaffold(
        body: Stack(children: [
          myStories[currentIndexStory],
          MyStoryBar(
            percentWatched: percentWatched,
          ),
        ]),
      ),
    );
  }

  _onTapDown(TapDownDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double positionDx = details.globalPosition.dx;
    // if user taps left of the screen
    if (positionDx < screenWidth / 2) {
      setState(() {
        if (currentIndexStory > 0) {
          percentWatched[currentIndexStory - 1] = 0;
          percentWatched[currentIndexStory] = 0;

          //go to previous story;
          currentIndexStory--;
        }
      });
    } else {
      setState(() {
        //IF THERE ARE MORE STORIES LEFT
        if (currentIndexStory < myStories.length - 1) {
          //finish current story
          percentWatched[currentIndexStory] = 1;
          // move to next story
          currentIndexStory++;
        } else {
          percentWatched[currentIndexStory] = 1;
        }
      });
    }
  }
}
