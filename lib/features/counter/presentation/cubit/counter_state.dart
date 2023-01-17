// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'counter_cubit.dart';

enum Status { initial, loading, loaded, failure }

class CounterState extends Equatable {
  final int counter;
  final Status status;

  const CounterState({required this.counter, required this.status});

  factory CounterState.initial() {
    return const CounterState(
      counter: 0,
      status: Status.initial,
    );
  }

  @override
  List<Object> get props => [counter, status];

  @override
  bool get stringify => true;

  CounterState copyWith({
    int? counter,
    Status? status,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      status: status ?? this.status,
    );
  }
}
