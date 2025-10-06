import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Constants/colors.dart';
import '../../businessLayer/cubit/charcters_cubit.dart';
import '../../data/model/charcters.dart';
import '../widgets/CharcterItem.dart';

class CharctersScreens extends StatefulWidget {
  const CharctersScreens({super.key});

  @override
  State<CharctersScreens> createState() => _CharctersScreensState();
}

class _CharctersScreensState extends State<CharctersScreens> {
  late List<Charecters> allCharcters;
  late List<Charecters> SearchForChar;
  bool _isSearching=false;
  TextEditingController Search =TextEditingController();


  @override
  void initState() {
    super.initState();
    allCharcters=BlocProvider.of<CharctersCubit>(context).getAllCharcters();  // this بينكش the cubit

  }

  Widget buildSearchFeild(){
    return TextField(
       controller: Search,
      cursorColor:ProColors.mygrey,
      decoration: InputDecoration(
        hintText: "Find a Character",
        border: InputBorder.none,
        hintStyle: TextStyle(color:ProColors.mygrey,fontSize: 18 )
      ),
      style: TextStyle(
        color: ProColors.mygrey,
      ),
      onChanged: (SearchForChar){
         addSearchedchar(SearchForChar);
      },
    );
  }

  void addSearchedchar(String searchForChar) {
    SearchForChar = allCharcters
        .where((char) => char.name.toLowerCase().startsWith(searchForChar.toLowerCase()))
        .toList();
    setState(() {

    });
  }
  
  List<Widget> appbar(){
    if(_isSearching ){

      return
        [
      IconButton(onPressed: (){
        clearSearch();
        Navigator.pop(context);

      },
          icon: Icon(Icons.clear,color:ProColors.mygrey ,))
    ];
    }
    else{

      return
        [
          IconButton(onPressed: (){
              ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove:stopSearch));
              setState(() {
                _isSearching = true;
              });
          },
              icon: Icon(Icons.search,color:ProColors.mygrey ,)),

        ];
    }
  }

  void stopSearch(){
    clearSearch();
    setState(() {
      _isSearching=false;
    });
  }

  void clearSearch(){
    setState(() {
      Search.clear();
    });
}

Widget buildAppBar(){

    return  Text("Charcters",style: TextStyle(color:ProColors.mygrey ),);
}



  Widget buildblocWidget(){
    return BlocBuilder<CharctersCubit,CharcterState>
      (builder: (context,state){
        if(state is CharcterLoaded){
          allCharcters=(state).charcters;
          return buildLoadedList();
        }
        else{
          return Center(child: CircularProgressIndicator(color: ProColors.myyellow,));
        }
    });
  }
  Widget buildLoadedList(){
    return SingleChildScrollView(
      child: Container(
        color: ProColors.mygrey,
        child: Column(
          children: [
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2/3,crossAxisSpacing: 1,mainAxisSpacing: 1),
               shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: Search.text.isEmpty? allCharcters.length: SearchForChar.length ,
              itemBuilder: (context, index) {
                  return Item(charecter: Search.text.isEmpty?allCharcters[index]:SearchForChar[index]);
                },
            )
          ],
        ),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        backgroundColor:ProColors.myyellow,
        title: _isSearching? buildSearchFeild():buildAppBar() ,
        actions: appbar(),
      ),
      body:buildblocWidget() ,

    ) ;
  }
}

