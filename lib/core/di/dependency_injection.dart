import 'package:dio/dio.dart';
import 'package:docdoc_app/core/networking/api_service.dart';
import 'package:docdoc_app/core/networking/dio_factory.dart';
import 'package:docdoc_app/features/login/data/repos/login_repo.dart';
import 'package:docdoc_app/features/login/logic/login_cubit.dart';
import 'package:docdoc_app/features/signup/data/repos/sign_up_repo.dart';
import 'package:docdoc_app/features/signup/logic/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
