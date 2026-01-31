part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}
final class AuthenticationError extends AuthenticationState {
  final String message;
  AuthenticationError(this.message);
}
final class AuthenticationSuccess extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationSignOn extends AuthenticationState {}

final class AuthenticationSignUp extends AuthenticationState {}
