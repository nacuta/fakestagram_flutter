import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  const StoryCircle({Key? key, this.function, required this.pathUrl}) : super(key: key);
  final function;
  final String pathUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                pathUrl
              ),
            ),
          ),
           const Text("Demo"),
        ],
      ),
    );
  }
}
