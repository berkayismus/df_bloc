import 'package:bloc/bloc.dart';
import 'package:df_bloc/features/counter/data/repositories/counter_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'counter_state.dart';

@LazySingleton()
class CounterCubit extends Cubit<CounterState> {
  CounterCubit(this.counterRepository) : super(CounterState.initial());

  final ICounterRepository counterRepository;

  Future<void> getCounter() async {
    try {
      emit(state.copyWith(status: Status.loading));

      final counter = await counterRepository.getCounter();
      emit(state.copyWith(counter: counter, status: Status.loaded));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
