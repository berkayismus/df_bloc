import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:df_bloc/features/counter/presentation/cubit/counter_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'background_color_state.dart';

@Injectable()
class BackgroundColorCubit extends Cubit<BackgroundColorState> {
  BackgroundColorCubit(this.counterCubit)
      : super(const BackgroundColorState()) {
    counterSub = counterCubit.stream.listen((counterState) {
      if (counterState.counter % 2 == 0) {
        emit(state.copyWith(backgroundColor: const Color(0xff84D2C5)));
      } else {
        emit(state.copyWith(backgroundColor: const Color(0xffE4C988)));
      }
    });
  }

  final CounterCubit counterCubit;
  late StreamSubscription<CounterState> counterSub;

  @override
  Future<void> close() {
    counterSub.cancel();
    return super.close();
  }
}
