import 'package:flutter/material.dart';
import '../widgets/quick_button.dart';

class QuickAction extends StatelessWidget {
  const QuickAction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FittedBox(
        //Si el contenido no cabe dependiendo del tamaño del dispositivo lo va a escalar, de forma que sea vea todo y bien.
        fit: BoxFit.contain,
        child: Row(
          children: [
            QuickButton(
              label: "Gallery",
              color: Color(0xff92BE87),
              iconData: Icons.photo,
            ),
            SizedBox(
              width: 10,
            ),
            QuickButton(
              label: "Tag Friends",
              color: Color(0xff2880D4),
              iconData: Icons.supervised_user_circle,
            ),
            SizedBox(
              width: 10,
            ),
            QuickButton(
              label: "Live",
              color: Color(0xffFB7171),
              iconData: Icons.camera_alt,
            ),
          ],
        ),
      ),
    );
  }
}
