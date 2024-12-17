import '../../../../core/error/failure.dart';
import '../../domain/entities/auth_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/auth_repository.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../data_sources/auth_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, AuthEntity>> login(LoginParam params) async {
    final userLogin = await remoteDataSource.login(params);
    return userLogin.fold(
      (failure) => Left(failure),
      (success) => Right(success),
    );
  }
}
