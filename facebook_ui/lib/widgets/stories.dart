import 'package:flutter/material.dart';
import '../widgets/avatar.dart';

final _stories = [
  Story(
    bg: 'assets/wallpapers/1.jpeg',
    avatar: 'assets/users/1.jpg',
    username: 'Laura Leporc',
  ),
  Story(
    bg: 'assets/wallpapers/2.jpeg',
    avatar: 'assets/users/2.jpg',
    username: 'Alix luca',
  ),
  Story(
    bg: 'assets/wallpapers/3.jpeg',
    avatar: 'assets/users/3.jpg',
    username: 'Moa Rotenb asdasdasd',
  ),
  Story(
    bg: 'assets/wallpapers/4.jpeg',
    avatar: 'assets/users/4.jpg',
    username: 'Lucas Roma',
  ),
  Story(
    bg: 'assets/wallpapers/5.jpeg',
    avatar: 'assets/users/5.jpg',
    username: 'Lucie Polis',
  ),
  Story(
    bg: 'assets/wallpapers/6.jpeg',
    avatar: 'assets/users/6.jpg',
    username: 'Feder',
  )
];

class Stories extends StatelessWidget {
  const Stories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.only(
        left: 20,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _stories.length,
        itemBuilder: (_, index) {
          final story = _stories[index];
          return _storyLayout(story);
        },
      ),
    );
  }
}

Widget _storyLayout(Story story) {
  return Container(
    height: 160,
    width: 90,
    margin: EdgeInsets.only(right: 12),
    child: Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 0,
                bottom: 20,
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(story.bg),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Avatar(
                  size: 40,
                  asset: story.avatar,
                  borderWidth: 3,
                ),
              ),
            ],
          ),
        ),
        Text(
          story.username,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

class Story {
  final String bg;
  final String avatar;
  final String username;

  Story({this.bg, this.avatar, this.username});
}
