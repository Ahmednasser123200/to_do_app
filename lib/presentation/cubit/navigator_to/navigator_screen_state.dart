part of 'navigator_screen_cubit.dart';

@immutable
sealed class NavigatorScreenState {
    const NavigatorScreenState();

}

final class NavigatorScreenInitial extends NavigatorScreenState {
  const NavigatorScreenInitial();
}

final class NavigatorToLoginScreenState extends NavigatorScreenState {
  const NavigatorToLoginScreenState();
}

final class NavigatorToHomeScreenState extends NavigatorScreenState {
  const NavigatorToHomeScreenState();
}

final class NavigatorTosignUpScreenState extends NavigatorScreenState {
  const NavigatorTosignUpScreenState();
}