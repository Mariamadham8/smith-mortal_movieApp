import 'package:dio/dio.dart';
import'package:flutter/material.dart';

import '../../Constants/String.dart';
import '../model/charcters.dart';

class CharctersApi{
 late Dio dio;

 CharctersApi(){
  BaseOptions option = BaseOptions(
     baseUrl: base_uri,
     connectTimeout:Duration(seconds: 60),
     receiveTimeout: Duration(seconds: 60),
     receiveDataWhenStatusError: true,
   );
   dio=Dio(option);
 }

 Future<List<dynamic>> getallCharcters() async{
   try{
     Response res= await dio.get('character');
     print(res.data.toString());
     return res.data['results'];
   }
   catch(e){
     print(e.toString());
     return [];
   }

 }

}