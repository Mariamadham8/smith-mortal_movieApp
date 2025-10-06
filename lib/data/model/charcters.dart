class Charecters{
  late int chartid;
  late String name;
  late String img;
  late String status;
  late List seasons1;


  Charecters.fromJson(Map<String,dynamic> json){
    chartid=json['id'];
    name=json['name'];
    img=json['image'];
    status=json['status'];
    seasons1=json['episode'];

  }


}