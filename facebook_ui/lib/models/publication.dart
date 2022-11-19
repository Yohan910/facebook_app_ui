import 'package:app_v1/models/user.dart';

class Publication {
  final User user;
  final String title;
  final DateTime createdAt;
  final String imageUrl;
  final int commentsCount;
  final int sharesCount;
  final Reaction currentUserReaction;

  Publication({
    this.user,
    this.title,
    this.createdAt,
    this.imageUrl,
    this.commentsCount,
    this.sharesCount,
    this.currentUserReaction,
  });
}

enum Reaction {
  like,
  love,
  laughing,
  sad,
  shocking,
  angry,
}
