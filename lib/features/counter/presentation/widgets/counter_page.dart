import 'package:df_bloc/core/di/injection.dart';
import 'package:df_bloc/features/background_color/presentation/cubit/background_color_cubit.dart';
import 'package:df_bloc/features/counter/presentation/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPageWrapperProvider extends StatelessWidget {
  const CounterPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CounterCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<BackgroundColorCubit>(),
        ),
      ],
      child: const CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Counter(),
      backgroundColor:
          context.watch<BackgroundColorCubit>().state.backgroundColor,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
        onPressed: () {
          getIt<CounterCubit>().getCounter();
        },
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          if (state.status == Status.initial) {
            return Text(
              '${state.counter}',
              style: const TextStyle(fontSize: 30),
            );
          } else if (state.status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == Status.loaded) {
            return Text(
              '${state.counter}',
              style: const TextStyle(fontSize: 30),
            );
          } else {
            return const Center(
              child: Text('hata'),
            );
          }
        },
      ),
    );
  }
}
