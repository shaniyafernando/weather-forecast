import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool>{
  ThemeCubit() : super(false);

  void toggle() => emit(!state);

  bool isDark() => state;
}