import 'package:docdoc_app/core/theming/colors.dart';
import 'package:docdoc_app/core/theming/styles.dart';
import 'package:docdoc_app/features/signup/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderDropdownField extends StatelessWidget {
  const GenderDropdownField({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: context.read<SignupCubit>().gender,
      items: [
        DropdownMenuItem(
          value: 0,
          child: Text(
            'Male',
            style: TextStyles.font14DarkBlueMedium,
          ),
        ),
        DropdownMenuItem(
          value: 1,
          child: Text(
            'Female',
            style: TextStyles.font14DarkBlueMedium,
          ),
        ),
      ],
      onChanged: (value) {
          context.read<SignupCubit>().gender = value!;
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.mainBlue,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.lighterGray,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        fillColor: ColorsManager.moreLightGray,
        filled: true,
      ),
    );
  }
}
