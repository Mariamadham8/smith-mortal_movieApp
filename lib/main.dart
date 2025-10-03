import 'package:flutter/material.dart';

import 'app_routing.dart';
//yellow :0x0xffffC107
//grey:0xff343A40
//white: 0xffE1EE8EB
void main() {
  runApp(MyApp(routes:AppRouter() ,));
}

class MyApp extends StatelessWidget {
  final AppRouter routes ;
  const MyApp({super.key, required this.routes});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routes.generateRoute,
    );


  }
}
