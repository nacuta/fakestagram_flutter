import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../views/post_view.dart';
import '../views/story_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final availableHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      // backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Fakestagram',
          style: GoogleFonts.lobster(fontSize: 30, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle_outline, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.whatsapp_outlined, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.heart_broken_outlined, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          StoryView(),
          Expanded(child: PostView()),
        ],
      ),
    );
  }
}
