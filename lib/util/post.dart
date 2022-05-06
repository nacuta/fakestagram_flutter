import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({Key? key, required this.avatarImage, required this.postImageUrl})
      : super(key: key);

  final String avatarImage;
  final String postImageUrl;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool _favorite = false;

  void _favoriteChange() {
    setState(() {
      _favorite = !_favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.avatarImage),
              ),
            ),
            const Text(
              "My Name",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            )
          ],
        ),
        GestureDetector(
          onDoubleTap: _favoriteChange,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 278,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.postImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              if (_favorite == true) ...[
                const Icon(
                  Icons.favorite,
                  size: 88,
                  color: Colors.red,
                ),
              ]
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: _favoriteChange,
              icon: _favorite
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border_outlined,
                      color: Colors.black),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.whatsapp_outlined, color: Colors.black),
            ),
            IconButton(
              onPressed: () {},
              icon:
                  const Icon(Icons.heart_broken_outlined, color: Colors.black),
            ),
          ],
        )
      ],
    );
  }
}
