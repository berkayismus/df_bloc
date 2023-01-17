import 'package:df_bloc/core/di/injection.dart';
import 'package:df_bloc/features/counter/presentation/widgets/counter_page.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: CounterPageWrapperProvider(),
    );
  }
}
