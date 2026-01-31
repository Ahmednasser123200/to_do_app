import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'navigator_screen_state.dart';

class NavigatorScreenCubit extends Cubit<NavigatorScreenState> {
  NavigatorScreenCubit() : super(const NavigatorScreenInitial());

  void goToLogin() => emit(const NavigatorToLoginScreenState());

  void goToHome() => emit(const NavigatorToHomeScreenState());
}

