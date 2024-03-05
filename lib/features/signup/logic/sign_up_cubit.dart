import 'package:docdoc_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:docdoc_app/features/signup/data/repos/sign_up_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_up_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  final SignupRepo signUpRepo;
  SignupCubit(this.signUpRepo) : super(const SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int gender = 0;
  TextEditingController passwordConfirmationController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void emitSignUpState() async {
    emit(const SignUpState.loading());
    final response = await signUpRepo.signup(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        gender: gender,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
      ),
    );

    response.when(
      success: (signUpResponse) {
        emit(SignUpState.success(signUpResponse));
      },
      failure: (error) {
        emit(SignUpState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
