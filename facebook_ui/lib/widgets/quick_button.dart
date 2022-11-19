import 'package:flutter/material.dart';
import '../widgets/circle_button.dart';

class QuickButton extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final String label;

  const QuickButton({
    Key key,
    this.iconData,
    this.color,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 15,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          CircleButton(
            color: color.withOpacity(0.6),
            iconData: iconData,
          ),
          SizedBox(
            width: 8,
          ),
          Text(label,
              style: TextStyle(
                color: color,
              )),
        ],
      ),
    );
  }
}
