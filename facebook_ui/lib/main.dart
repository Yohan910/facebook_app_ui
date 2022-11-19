import 'package:flutter/material.dart';
import 'facebook_ui/facebook_ui.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
        //Widget que permite visualizar la app en diferentes dispositivos.
        enabled:
            false, //Si esta en false se desabilidad la posibilidad de verla en varios disp..
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      home: FacebookUi(),
    );
  }
}
