import 'package:breakingbad_movie/presentation/screens/charctersScreen.dart';
import 'package:breakingbad_movie/presentation/screens/charcterDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Constants/String.dart';
import 'businessLayer/cubit/charcters_cubit.dart';
import 'data/reprsitory/CharcterRepo.dart';
import 'data/webservices/CharcterWebService.dart';


class AppRouter{
  late CharctersCubit charctersCubit;
  late CharcterRepo charcterRepo;
  AppRouter(){
    charcterRepo= CharcterRepo(charctersapi: CharctersApi());
    charctersCubit = CharctersCubit(charcterRepo);
  }
  Route? generateRoute( RouteSettings settings){
    switch(settings.name){
      case charchtersScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create:(BuildContext context) => CharctersCubit(charcterRepo) ,
          child: CharctersScreens(),
        ),);

      case charcterDetails:
        return MaterialPageRoute(builder: (_) => CharcterDetails(),);

      default:


    }

  }
}