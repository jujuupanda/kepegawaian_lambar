part of 'services.dart';

class _Header {
  static Map<String, String> get(String token) {
    return {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  static Map<String, String> post(String token) {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  static Map<String, String> update(String token) {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  static Map<String, String> delete(String token) {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  static Map<String, String> login() {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }
}

class _TokenChecker {
  verify(String token) {}
}

class ApiService {
  static const _baseUrl = "https://reqres.in/";

  ///General method for http request
  static Future<Either<Failure, Map<String, dynamic>>> requestHandler(
      Future<http.Response> Function() request) async {
    try {
      final response = await request().timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return Right(jsonDecode(response.body));
      } else {
        return Left(
          ServerFailure("${response.statusCode}: ${response.reasonPhrase}"),
        );
      }
    } on TimeoutException {
      return const Left(
        TimeoutFailure("Request timed out, silahkan coba lagi."),
      );
    } on SocketException {
      return const Left(
        ConnectionFailure("Tidak ada koneksi internet."),
      );
    } on HttpException {
      return const Left(ServerFailure("Kesalahan pada server."));
    } on FormatException {
      return const Left(UnexpectedFailure("Respon tidak sesuai."));
    } catch (e) {
      return Left(UnexpectedFailure("Error tidak diketahui: $e"));
    }
  }

  ///GET Request
  static Future<Either<Failure, Map<String, dynamic>>> getRequest(
    String endpoint,
    String token,
  ) {
    final url = Uri.parse("$_baseUrl$endpoint");
    return requestHandler(
      () => http.get(
        url,
        headers: _Header.get(token),
      ),
    );
  }

  ///POST Request
  static Future<Either<Failure, Map<String, dynamic>>> postRequest(
    String endpoint,
    String token,
    Map<String, dynamic> data,
  ) {
    final url = Uri.parse("$_baseUrl$endpoint");
    return requestHandler(
      () => http.post(
        url,
        headers: _Header.post(token),
        body: jsonEncode(data),
      ),
    );
  }

  ///PATCH Request
  static Future<Either<Failure, Map<String, dynamic>>> patchRequest(
    String endpoint,
    String token,
    Map<String, dynamic> data,
  ) {
    final url = Uri.parse("$_baseUrl$endpoint");
    return requestHandler(
      () => http.patch(
        url,
        headers: _Header.update(token),
        body: jsonEncode(data),
      ),
    );
  }

  ///PUT Request
  static Future<Either<Failure, Map<String, dynamic>>> putRequest(
    String endpoint,
    String token,
    Map<String, dynamic> data,
  ) {
    final url = Uri.parse("$_baseUrl$endpoint");
    return requestHandler(
      () => http.put(
        url,
        headers: _Header.update(token),
        body: jsonEncode(data),
      ),
    );
  }

  ///DELETE Request
  static Future<Either<Failure, Map<String, dynamic>>> deleteRequest(
    String endpoint,
    String token,
    Map<String, dynamic> data,
  ) {
    final url = Uri.parse("$_baseUrl$endpoint");
    return requestHandler(
      () => http.delete(
        url,
        headers: _Header.delete(token),
        body: jsonEncode(data),
      ),
    );
  }

  ///LOGIN Request
  static Future<Either<Failure, Map<String, dynamic>>> loginRequest(
    String endpoint,
    Map<String, dynamic> data,
  ) {
    final url = Uri.parse("$_baseUrl$endpoint");
    return requestHandler(
      () => http.post(
        url,
        headers: _Header.login(),
        body: jsonEncode(data),
      ),
    );
  }
}
