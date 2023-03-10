// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:df_bloc/features/background_color/presentation/cubit/background_color_cubit.dart'
    as _i5;
import 'package:df_bloc/features/counter/data/repositories/counter_repository.dart'
    as _i3;
import 'package:df_bloc/features/counter/presentation/cubit/counter_cubit.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ICounterRepository>(() => _i3.CounterRepository());
    gh.lazySingleton<_i4.CounterCubit>(
        () => _i4.CounterCubit(gh<_i3.ICounterRepository>()));
    gh.factory<_i5.BackgroundColorCubit>(
        () => _i5.BackgroundColorCubit(gh<_i4.CounterCubit>()));
    return this;
  }
}
