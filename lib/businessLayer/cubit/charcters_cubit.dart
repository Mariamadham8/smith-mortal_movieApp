import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import '../../data/model/charcters.dart';
import '../../data/reprsitory/CharcterRepo.dart';

part 'charcter_stata.dart';

class CharctersCubit extends Cubit<CharcterState> {
  final CharcterRepo charRepo;
  List<Charecters> charecters=[];

  CharctersCubit(this.charRepo) : super(CharcterIntialState());

  List<Charecters> getAllCharcters() {
    charRepo.getallCharcters().then((charcter) {
      emit(CharcterLoaded(charcter));
      this.charecters = charcter;
    });
    return charecters;
  }
}
