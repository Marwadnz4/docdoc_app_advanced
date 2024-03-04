import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String? message;
  final bool? status;
  final int? code;
  @JsonKey(name: 'data')
  final UserData? userData;

  LoginResponse({required this.message, required this.status, required this.code, required this.userData});
  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final String token;
  @JsonKey(name: 'username')
  final String userName;

  UserData({required this.token, required this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}
