import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/auth_entity.dart';
import '../use_cases/login_use_case.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> login(LoginParam params);
}
