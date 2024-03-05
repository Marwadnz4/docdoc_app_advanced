import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theming/colors.dart';
import 'package:docdoc_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;
  final bool hasPasswordsMatch;
  final bool isSignUpScreen;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasNumber,
    required this.hasSpecialCharacter,
    required this.hasMinLength,
    this.hasPasswordsMatch = false,
    this.isSignUpScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(2),
        buildValidationRow('At least 1 number', hasNumber),
        verticalSpace(2),
        buildValidationRow('At least 1 special character', hasSpecialCharacter),
        verticalSpace(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
        if (isSignUpScreen) verticalSpace(2),
        if (isSignUpScreen) buildValidationRow('Your Passwords must be Matching', hasPasswordsMatch),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) => Row(
        children: [
          const CircleAvatar(
            radius: 2.5,
            backgroundColor: ColorsManager.gray,
          ),
          horizontalSpace(6),
          Text(
            text,
            style: TextStyles.font13DarkBlueRegular.copyWith(
              decoration: hasValidated ? TextDecoration.lineThrough : TextDecoration.none,
              decorationColor: Colors.green,
              decorationThickness: 2,
              color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
            ),
          ),
        ],
      );
}
