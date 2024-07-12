part of 'documents_cubit.dart';

enum DocumentsStatus {
  initial,
  loading,
  data,
  error,
}

class DocumentsState extends Equatable {
  final DocumentsStatus status;

  const DocumentsState({
    this.status = DocumentsStatus.initial,
  });

  @override
  List<Object> get props => [status];
}
