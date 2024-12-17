import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:initial_setup_for_flutter/features/login/domain/entities/auth_entity.dart';
import 'package:initial_setup_for_flutter/features/login/domain/repositories/auth_repository.dart';
import 'package:initial_setup_for_flutter/features/login/domain/use_cases/login_use_case.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  LoginUseCase loginUseCase;
  MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUseCase = LoginUseCase(mockAuthRepository);
  });

  const loginParam = LoginParam(username: "user", password: "user123");
  final authEntity = AuthEntity(token: "token from user");

  group(
    "login group test",
    () {
      test(
        "should be success login and return token",
        () async {
          //arrange
          // when(mockAuthRepository.login(loginParam))
          //     .thenAnswer((_) async => Right(authEntity));
          //act
          //assert
        },
      );
    },
  );
}
