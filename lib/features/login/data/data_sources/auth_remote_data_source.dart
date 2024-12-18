part of 'auth_data_source.dart';

class AuthRemoteDataSource extends AuthDataSource {
  @override
  Future<Either<Failure, AuthModel>> login(LoginParam params) async {
    const endpoint = "api/login";
    final data = {
      "email": params.username,
      "password": params.password,
    };
    final result = await ApiService.loginRequest(endpoint, data);
    return result.fold(
      (failure) => Left(failure),
      (success) => Right(AuthModel.fromJson(success)),
    );
  }
}
