import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'documents2_event.dart';
part 'documents2_state.dart';

class Documents2Bloc extends Bloc<Documents2Event, Documents2State> {
  Documents2Bloc()
      : super(const Documents2State(status: Documents2Status.initial)) {
    on<Documents2Event>((event, emit) async {
      emit(const Documents2State(status: Documents2Status.loading));

      await Future.delayed(const Duration(seconds: 3));

      emit(const Documents2State(status: Documents2Status.data));
    });
  }
}
