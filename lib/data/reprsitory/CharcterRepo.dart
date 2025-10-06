

import '../model/charcters.dart';
import '../webservices/CharcterWebService.dart';

class CharcterRepo{
 final  CharctersApi charctersapi;

  CharcterRepo({required this.charctersapi});

 Future<List<Charecters>> getallCharcters() async{
   final charcters = await charctersapi.getallCharcters();
   return charcters.map((charcter) => Charecters.fromJson(charcter)).toList();
 }
}