import 'package:docdoc_app/core/networking/api_error_handler.dart';
import 'package:docdoc_app/core/networking/api_result.dart';
import 'package:docdoc_app/core/networking/api_service.dart';
import 'package:docdoc_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:docdoc_app/features/signup/data/models/sign_up_response.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignUpResponse>> signup(SignUpRequestBody signUpRequestBody) async {
    try {
      final response = await _apiService.signup(signUpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
