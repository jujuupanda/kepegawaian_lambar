import 'package:flutter_test/flutter_test.dart';
import 'package:initial_setup_for_flutter/core/error/failure.dart';
import 'package:initial_setup_for_flutter/core/utils/failure_helper.dart';
import 'package:mockito/mockito.dart';

class MockFailureHelper extends Mock implements FailureHelper {}

void main() {
  group('Failure Tests', () {
    test('ServerFailure should contain correct error message', () {
      const failure = ServerFailure("Server Error");
      final failureHelper = FailureHelper.failure(failure);
      expect(failureHelper, "Server Error");
      expect(failure.props, ["Server Error"]); // Menguji Equatable props
    });

    test('InputFailure should contain correct error message', () {
      const failure = InputFailure('Invalid Input');
      final failureHelper = FailureHelper.failure(failure);
      expect(failureHelper, "Invalid Input");
      expect(failure.props, ['Invalid Input']); // Menguji Equatable props
    });

    test('CacheFailure should contain correct error message', () {
      const failure = CacheFailure('Cache Miss');
      final failureHelper = FailureHelper.failure(failure);
      expect(failureHelper, "Cache Miss");
      expect(failure.props, ['Cache Miss']); // Menguji Equatable props
    });

    test('Different Failures should not be equal', () {
      const serverFailure = ServerFailure('Server Error');
      const inputFailure = InputFailure('Invalid Input');
      const cacheFailure = CacheFailure('Cache Miss');

      expect(serverFailure == inputFailure, isFalse);
      expect(serverFailure == cacheFailure, isFalse);
      expect(inputFailure == cacheFailure, isFalse);
    });

    test('Same Failures with same error message should be equal', () {
      const failure1 = ServerFailure('Server Error');
      const failure2 = ServerFailure('Server Error');

      expect(failure1,
          equals(failure2)); // Menggunakan Equatable untuk membandingkan
    });
  });
}
