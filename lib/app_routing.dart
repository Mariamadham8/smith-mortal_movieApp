import 'package:breakingbad_movie/presentation/screens/charctersScreen.dart';
import 'package:breakingbad_movie/presentation/screens/charcterDetails.dart';
import 'package:flutter/material.dart';
import 'Constants/String.dart';


class AppRouter{
  Route? generateRoute( RouteSettings settings){
    switch(settings.name){
      case charchtersScreen:
        return MaterialPageRoute(builder: (_) => CharctersScreens(),);

      case charcterDetails:
        return MaterialPageRoute(builder: (_) => CharcterDetails(),);

      default:


    }

  }
}