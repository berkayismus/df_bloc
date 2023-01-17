import 'dart:math';

import 'package:injectable/injectable.dart';

abstract class ICounterRepository {
  Future<int> getCounter();
}

@Injectable(as: ICounterRepository)
class CounterRepository implements ICounterRepository {
  @override
  Future<int> getCounter() async {
    await Future.delayed(const Duration(seconds: 2));
    final counter = Random().nextInt(10);
    return counter;
  }
}
