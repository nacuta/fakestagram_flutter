import 'package:flutter/material.dart';

import '../util/post.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  List<String> postImageUrl = [
    "https://servuspress.ro/wp-content/uploads/2021/04/Petrosani-1.jpg",
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/1f/2f/07/huvost-ado-ernyok.jpg?w=1200&h=-1&s=1",
    "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/fb/35/22/wasserlauf.jpg?w=1200&h=-1&s=1",
  ];
  List<String> avatarImage = [
    "https://media-exp1.licdn.com/dms/image/C4E03AQEPWLS5R8Uvdg/profile-displayphoto-shrink_200_200/0/1646772374465?e=2147483647&v=beta&t=NZY1kWTOzpbabidKcQd7oyZ0fjDL61esoWgCeI1fvBc",
    "https://media-exp1.licdn.com/dms/image/C4E03AQEPWLS5R8Uvdg/profile-displayphoto-shrink_200_200/0/1646772374465?e=2147483647&v=beta&t=NZY1kWTOzpbabidKcQd7oyZ0fjDL61esoWgCeI1fvBc",
    "https://media-exp1.licdn.com/dms/image/C4E03AQEPWLS5R8Uvdg/profile-displayphoto-shrink_200_200/0/1646772374465?e=2147483647&v=beta&t=NZY1kWTOzpbabidKcQd7oyZ0fjDL61esoWgCeI1fvBc",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Post(
              avatarImage: avatarImage[index],
              postImageUrl: postImageUrl[index]);
        });
  }
}
