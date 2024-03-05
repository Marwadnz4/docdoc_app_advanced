import 'package:docdoc_app/core/helpers/app_regex.dart';
import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/widgets/app_text_form_field.dart';
import 'package:docdoc_app/features/signup/logic/sign_up_cubit.dart';
import 'package:docdoc_app/features/signup/ui/widgets/gender_dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docdoc_app/features/login/ui/widgets/password_validations.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  late TextEditingController passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                flex: 2,
                child: AppTextFormField(
                  controller: context.read<SignupCubit>().nameController,
                  hintText: 'Name',
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid name';
                    }
                  },
                ),
              ),
              horizontalSpace(5),
              const Expanded(child: GenderDropdownField()),
            ],
          ),
          verticalSpace(8),
          AppTextFormField(
            controller: context.read<SignupCubit>().emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          verticalSpace(8),
          AppTextFormField(
            controller: context.read<SignupCubit>().phoneController,
            hintText: 'Phone',
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone';
              }
            },
          ),
          verticalSpace(8),
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            hintText: 'Password',
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalSpace(8),
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordConfirmationController,
            hintText: 'Password Confirmation',
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password confirmation';
              }
            },
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText = !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalSpace(8),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasNumber: hasNumber,
            hasSpecialCharacter: hasSpecialCharacter,
            hasMinLength: hasMinLength,
            isSignUpScreen: true,
            hasPasswordsMatch: context.read<SignupCubit>().passwordController.text == context.read<SignupCubit>().passwordConfirmationController.text,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
