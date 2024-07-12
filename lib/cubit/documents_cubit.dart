import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'documents_state.dart';

class DocumentsCubit extends Cubit<DocumentsState> {
  DocumentsCubit() : super(const DocumentsState());

  Future<void> load() async {
    emit(const DocumentsState(status: DocumentsStatus.loading));

    await Future.delayed(const Duration(seconds: 3));

    emit(const DocumentsState(status: DocumentsStatus.data));
  }
}
