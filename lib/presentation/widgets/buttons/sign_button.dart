import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignButton extends StatelessWidget {
  const SignButton({super.key, this.onPressed, this.text, this.color});
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      // ignore: sort_child_properties_last
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.h),
        child: Text(
          text ?? "Sign In",
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        backgroundColor: color ?? const Color.fromARGB(255, 51, 13, 222),
        minimumSize: const Size(double.infinity, 50),
      ),
    );
  }
}
