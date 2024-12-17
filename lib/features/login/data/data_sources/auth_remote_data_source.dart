part of 'auth_data_source.dart';

class AuthRemoteDataSource extends AuthDataSource {
  final db = DatabaseService().db;

  @override
  Future<Either<Failure, AuthModel>> login(LoginParam params) async {
    const endpoint = "/api/login";
    final data = {
      "username": params.username,
      "password": params.password,
    };
    final result = await ApiHelper.loginRequest(endpoint, data);
    return result.fold(
      (failure) => Left(failure),
      (success) => Right(AuthModel.fromJson(success["token"])),
    );
  }
}
