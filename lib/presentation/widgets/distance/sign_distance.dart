import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SignDistance extends StatelessWidget {
  const SignDistance({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20.w),
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            text ?? "OR",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1.h,
          ),
        ),
        SizedBox(width: 20.w),
      ],
    );
  }
}