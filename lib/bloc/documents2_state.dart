part of 'documents2_bloc.dart';

enum Documents2Status {
  initial,
  loading,
  data,
  error,
}

class Documents2State extends Equatable {
  final Documents2Status status;

  const Documents2State({
    this.status = Documents2Status.initial,
  });

  @override
  List<Object> get props => [status];
}
