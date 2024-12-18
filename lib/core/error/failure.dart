import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String error;

  const Failure(this.error);

  @override
  List<Object?> get props => [error];
}

class ServerFailure extends Failure {
  const ServerFailure(super.error);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(super.message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(super.message);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message);
}

class InputFailure extends Failure {
  const InputFailure(super.error);
}

class CacheFailure extends Failure {
  const CacheFailure(super.error);
}
class JWTFailure extends Failure {
  const JWTFailure(super.error);
}
