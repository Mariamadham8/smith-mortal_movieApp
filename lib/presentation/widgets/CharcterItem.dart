import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../data/model/charcters.dart';

class Item extends StatelessWidget {
  final Charecters charecter;
  const Item({super.key,required this.charecter});

  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.infinity,
       margin: EdgeInsetsDirectional.fromSTEB(8,8,8, 8),
      padding: EdgeInsets.all(4) ,
      decoration: BoxDecoration(
        color: ProColors.mywhite,
        borderRadius: BorderRadius.circular(8)
      ),
      child: GridTile(
        child: Container(
          color:ProColors.mygrey,
          child:charecter.img.isNotEmpty?Image(image: NetworkImage(charecter.img),width: double.infinity,height: double.infinity,fit: BoxFit.cover,):CircularProgressIndicator(color: ProColors.myyellow,) ,
        ),
        footer:Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical:10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text("${charecter.name}",
            style: TextStyle(
                fontSize: 16,height: 1.6,
                color:ProColors.mywhite,
                fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
                ),
            maxLines: 2,
            textAlign:TextAlign.center ,
            ),

        ),
      ),
    ) ;
  }
}
