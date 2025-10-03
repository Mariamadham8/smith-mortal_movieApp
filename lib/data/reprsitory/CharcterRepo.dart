

import '../webservices/CharcterWebService.dart';

class CharcterRepo{
 final  CharctersApi charctersapi;

  CharcterRepo(this.charctersapi);

 Future<List<dynamic>> getallCharcters() async{
   final charcters = await charctersapi.getallCharcters();
   return charcters.map((charcter) => charcter.fromJson(charcter)).toList();
 }



}