import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final bool showBadge;

  const CircleButton({
    Key key,
    this.color,
    this.iconData,
    this.showBadge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          showBadge
              ? Positioned(
                  top: -2,
                  right: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        )),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
