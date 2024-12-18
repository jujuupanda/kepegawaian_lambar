import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/services/services.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../models/auth_model.dart';

part 'auth_remote_data_source.dart';

abstract class AuthDataSource {
  Future<Either<Failure, AuthModel>> login(LoginParam params);
}
