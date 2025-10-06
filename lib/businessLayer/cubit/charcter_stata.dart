part of 'charcters_cubit.dart';


@immutable
abstract class CharcterState{}

class CharcterIntialState extends CharcterState{}

class CharcterLoaded extends CharcterState{
   List<Charecters> charcters;
   CharcterLoaded(this.charcters);

}