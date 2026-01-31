import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  Future<void> signUp({
    required String name,
    required String emailAddress,
    required String password,
  }) async {
    if (name.isEmpty || emailAddress.isEmpty || password.isEmpty) {
      emit(AuthenticationError("All fields are required"));
      return;
    }

    emit(AuthenticationLoading());

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

      await credential.user!.updateDisplayName(name);

      emit(AuthenticationSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthenticationError("Password is too weak"));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthenticationError("Email already in use"));
      } else if (e.code == 'invalid-email') {
        emit(AuthenticationError("Invalid email"));
      } else {
        emit(AuthenticationError(e.message ?? "Auth error"));
      }
    } catch (e) {
      emit(AuthenticationError("Something went wrong"));
    }
  }
}
