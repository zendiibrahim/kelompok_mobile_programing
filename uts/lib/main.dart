import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uts/splashscreen.dart';

void main() => runApp( MyApp());
class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }

}


class HomePage extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen()
    );
  }
}
