import 'package:docdoc_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:docdoc_app/core/helpers/font_weight_helper.dart';

class TextStyles {
  static TextStyle font24BlackBold = TextStyle(
    color: Colors.black,
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font32BlueBold = TextStyle(
    color: ColorsManager.mainBlue,
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font24BlueBold = TextStyle(
    color: ColorsManager.mainBlue,
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font13GrayRegular = TextStyle(
    color: ColorsManager.gray,
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font13BlueRegular = TextStyle(
    color: ColorsManager.mainBlue,
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14GrayRegular = TextStyle(
    color: ColorsManager.gray,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14LightGrayRegular = TextStyle(
    color: ColorsManager.lightGray,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    color: ColorsManager.darkBlue,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font13DarkBlueMedium = TextStyle(
    color: ColorsManager.darkBlue,
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font13DarkBlueRegular = TextStyle(
    color: ColorsManager.darkBlue,
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font13BlueSemiBold = TextStyle(
    color: ColorsManager.mainBlue,
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font15DarkBlueMedium = TextStyle(
    color: ColorsManager.darkBlue,
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font14BlueSemiBold = TextStyle(
    color: Colors.blue,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
}
