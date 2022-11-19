import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import '../models/publication.dart';
import '../models/user.dart';
import '../widgets/publications_items.dart';
import '../widgets/stories.dart';
import '../widgets/what_is_your_mind.dart';
import '../widgets/circle_button.dart';
import '../widgets/quick_action.dart';

class FacebookUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final publications = [];

    for (var i = 0; i < 50; i++) {
      final random = faker.randomGenerator;
      final reactionIndex = random.integer(Reaction.values.length - 1);
      final publication = Publication(
        user: User(
          username: faker.person.name(),
          avatar: faker.image.image(),
        ),
        title: faker.lorem.sentence(),
        createdAt: faker.date.dateTime(),
        imageUrl: faker.image.image(),
        commentsCount: random.integer(50000),
        sharesCount: random.integer(50000),
        currentUserReaction: Reaction.values[reactionIndex],
      );
      publications.add(publication);
    }

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Image.asset(
          'assets/logos/facebook.png',
          color: Colors.blueAccent,
        ),
        actions: [
          CircleButton(
            color: Color(0xffbfbfbf),
            iconData: Icons.search,
          ),
          SizedBox(
            width: 15,
          ),
          CircleButton(
            color: Color(0xfffFE7574),
            iconData: Icons.add_alert,
          ),
          SizedBox(
            width: 15,
          ),
          CircleButton(
            color: Color(0xfff7BBAFF),
            iconData: Icons.supervised_user_circle,
            showBadge: true,
          ),
          SizedBox(
            width: 15,
          ),
          CircleButton(
            color: Color(0xfff1C86E4),
            iconData: Icons.comment,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: ListView(
        children: [
          WhatIsOnYourMind(),
          SizedBox(height: 24),
          QuickAction(),
          SizedBox(height: 30),
          Stories(),
          SizedBox(height: 25),
          ListView.builder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap:
                true, //Para que tome las dimensiones del ListView padre.
            itemBuilder: (_, index) => PublicationsItems(
              publication: publications[index],
            ),
            itemCount: publications.length,
          ),
        ],
      ),
    );
  }
}
