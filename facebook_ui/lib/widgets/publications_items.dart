import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';
import '../models/publication.dart';
import '../widgets/avatar.dart';

class PublicationsItems extends StatelessWidget {
  final Publication publication;

  const PublicationsItems({Key key, this.publication}) : super(key: key);

  String _getEmojiPath(Reaction reaction) {
    switch (reaction) {
      case Reaction.like:
        return "assets/emojis/like.png";
      case Reaction.love:
        return "assets/emojis/heart.png";
      case Reaction.laughing:
        return "assets/emojis/laughing.png";
      case Reaction.sad:
        return "assets/emojis/sad.png";
      case Reaction.shocking:
        return "assets/emojis/shocked.png";
      default:
        return "assets/emojis/angry.png";
    }
  }

  String _formatCount(int value) {
    if (value <= 1000) {
      return value.toString();
    } else {
      return "${(value / 1000).toStringAsFixed(1)}k";
    }
  }

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    );
    final reactions = Reaction.values;
    final imageProvider = CachedNetworkImageProvider(publication.imageUrl);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 6,
            color: Color(0xffEBEBEB),
          ),
        ),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: padding,
            child: Row(
              children: [
                Avatar(
                  size: 40,
                  asset: "assets/users/1.jpg",
                ),
                SizedBox(
                  width: 10,
                ),
                Text(publication.user.username),
                Spacer(),
                Text(timeago.format(publication
                    .createdAt)) //format() function of plugin "timeago".
              ],
            ),
          ),
          AspectRatio(
            //Permite que la imagen sea vea igual en dimensiones segun el tamaño del dispositivo.
            aspectRatio: 16 / 9,
            child: Image.network(
              imageProvider.url,
              height: 190,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: padding.copyWith(top: 20),
            child: Text(
              publication.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: "Arial",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      reactions.length,
                      (index) {
                        final reaction = reactions[index];
                        final isActive =
                            reaction == publication.currentUserReaction;
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  right: 7,
                                ),
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(_getEmojiPath(reaction)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              isActive
                                  ? Container(
                                      width: 3,
                                      height: 3,
                                      decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius:
                                              BorderRadius.circular(1.5)),
                                    )
                                  : Container(),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Row(
                      children: [
                        Text(
                            "${_formatCount(publication.commentsCount)} Comments"),
                        SizedBox(
                          width: 15,
                        ),
                        Text("${_formatCount(publication.sharesCount)} Shares"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
