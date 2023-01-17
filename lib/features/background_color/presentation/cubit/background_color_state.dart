// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'background_color_cubit.dart';

class BackgroundColorState extends Equatable {
  final Color backgroundColor;

  const BackgroundColorState({this.backgroundColor = Colors.white});

  @override
  List<Object> get props => [backgroundColor];

  BackgroundColorState copyWith({
    Color? backgroundColor,
  }) {
    return BackgroundColorState(
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }
}
