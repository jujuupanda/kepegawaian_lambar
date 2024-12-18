part of 'services.dart';

class TokenService {
  /// sign jwt with expiration 7 days
  static jwtWithExpiration(String username, String role) {
    final jwt = JWT(
      {
        'username': username,
        'role': role,
      },
    );

    final token = jwt.sign(
      SecretKey('someSecret'),
      expiresIn: const Duration(days: 7),
    );

    return token;
  }

  /// verify jwt with secret key
  static Either<Failure, JWT> verifyToken(String token) {
    try {
      final jwt = JWT.verify(token, SecretKey('someSecret'));
      return Right(jwt);
    } on JWTExpiredException {
      return const Left(JWTFailure("Token kadaluarsa"));
    } on JWTException {
      return const Left(JWTFailure("Token tidak sesuai"));
    } catch (e) {
      return const Left(JWTFailure("Error tidak diketahui"));
    }
  }

  /// fcm token for messaging/notification
// fcmToken() async {
//   try {
//     final fcmToken = await firebaseMessaging.getToken();
//     return fcmToken;
//   } catch (e) {
//     throw Exception(e);
//   }
// }
}
