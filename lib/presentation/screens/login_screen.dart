import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../cubit/authentication/authentication_cubit.dart';
import '../cubit/navigator_to/navigator_screen_cubit.dart';
import '../widgets/buttons/sign_button.dart';
import '../widgets/distance/sign_distance.dart';
import '../widgets/textfield/sign_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthenticationCubit()),
        BlocProvider(create: (_) => NavigatorScreenCubit()),
      ],
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 51, 13, 222),
        body: MultiBlocListener(
          listeners: [
            BlocListener<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationSuccess) {
                  context.read<NavigatorScreenCubit>().goToHome();
                }
                if (state is AuthenticationError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
            ),
            BlocListener<NavigatorScreenCubit, NavigatorScreenState>(
              listener: (context, state) {
                if (state is NavigatorTosignUpScreenState) {
                  Navigator.pushReplacementNamed(context, '/signUp');
                }
                if (state is NavigatorToHomeScreenState) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
            ),
          ],
          child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, State) {
              return Stack(
                children: [
                  sign_in_ui(context),
                  if (State is AuthenticationLoading)
                    Container(
                      color: Colors.black.withOpacity(0.3),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

sign_in_ui(BuildContext context) {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 20.w),
            child: Text(
              "Don't have an account?",
              style: TextStyle(color: Colors.white70, fontSize: 16.sp),
            ),
          ),
          SizedBox(width: 30.w),
          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 10.w),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/signUp');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 88, 58, 220),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.h,
                      vertical: 6.h,
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 20.h, bottom: 50.h),
        child: Center(
          child: Text(
            "Taskora",
            style: TextStyle(
              fontSize: 48.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.w, bottom: 10.w),
                child: Center(
                  child: Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Enter your details below",
                  style: TextStyle(color: Colors.black45, fontSize: 15.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: SignTextfield(
                  controller: emailController,
                  hintText: "Enter your email",
                  labelText: "Email",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: SignTextfield(
                  controller: passwordController,
                  hintText: "Enter your password",
                  labelText: "Password",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: SignButton(
                  color: const Color.fromARGB(255, 51, 13, 222),
                  onPressed: () {
                    context.read<AuthenticationCubit>().signIn(
                      emailAddress: emailController.text,
                      password: passwordController.text,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
                child: InkWell(
                  onTap: () {
                    // Handle forgot password action
                  },
                  child: Center(
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(color: Colors.black87, fontSize: 15.sp),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: SignDistance(text: "Or sign in with"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150.w,
                    child: SignInButton(
                      Buttons.google,
                      onPressed: () {},
                      text: "Google",
                    ),
                  ),
                  SizedBox(
                    width: 150.w,
                    child: SignInButton(
                      Buttons.facebook,
                      onPressed: () {},
                      text: "Facebook",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
