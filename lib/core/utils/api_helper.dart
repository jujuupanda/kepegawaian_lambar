import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../error/failure.dart';
import '../services/database_service.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static final _urlAPI = DatabaseService().db;

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
      String endpoint) async {
    final url = Uri.parse("$_urlAPI$endpoint");
    return requestHandler(
      () => http.get(
        url,
        headers: {
          "Accept": "application/json",
          // "Authorization": "Bearer $token", isi dengan token jika diperlukan
        },
      ),
    );
  }

  ///POST Request
  static Future<Either<Failure, Map<String, dynamic>>> postRequest(
      String endpoint, String token, Map<String, dynamic> data) async {
    final url = Uri.parse("$_urlAPI$endpoint");
    return requestHandler(
      () => http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(data),
      ),
    );
  }

  ///LOGIN Request
  static Future<Either<Failure, Map<String, dynamic>>> loginRequest(
      String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse("$_urlAPI$endpoint");

    return requestHandler(
      () => http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(data),
      ),
    );
  }

// static Future<Either<Failure, Map<String, dynamic>>> getRequest(
//     String endpoint) async {
//   final url = Uri.parse("$_urlAPI$endpoint");
//   try {
//     final response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       return Right(jsonDecode(response.body));
//     } else {
//       return Left(
//         ServerFailure("${response.statusCode}: ${response.reasonPhrase}"),
//       );
//     }
//   } on TimeoutException {
//     return const Left(
//       TimeoutFailure("Request timed out, silahkan coba lagi."),
//     );
//   } on SocketException {
//     return const Left(
//       ConnectionFailure("Tidak ada koneksi internet."),
//     );
//   } on HttpException {
//     return const Left(ServerFailure("Kesalahan pada server."));
//   } catch (e) {
//     return Left(ServerFailure("Error tidak diketahui: $e"));
//   }
// }

// static Future<Either<Failure, Map<String, dynamic>>> postRequest(
//     String endpoint, String token, Map<String, dynamic> data) async {
//   final url = Uri.parse("$_urlAPI$endpoint");
//   try {
//     final response = await http.post(
//       url,
//       headers: {
//         "Content-Type": "application/json",
//         "Accept": "application/json",
//         "Authorization": "Bearer $token",
//       },
//       body: jsonEncode(data),
//     );
//
//     if (response.statusCode == 200) {
//       return Right(jsonDecode(response.body));
//     } else {
//       return Left(
//         ServerFailure("${response.statusCode}: ${response.reasonPhrase}"),
//       );
//     }
//   } on TimeoutException {
//     return const Left(
//       TimeoutFailure("Request timed out, silahkan coba lagi."),
//     );
//   } on SocketException {
//     return const Left(
//       ConnectionFailure("Tidak ada koneksi internet."),
//     );
//   } on HttpException {
//     return const Left(ServerFailure("Kesalahan pada server."));
//   } catch (e) {
//     return Left(ServerFailure("Error tidak diketahui: $e"));
//   }
// }

// static Future<Either<Failure, Map<String, dynamic>>> loginRequest(
//     String endpoint, Map<String, dynamic> data) async {
//   final url = Uri.parse("$_urlAPI$endpoint");
//
//   try {
//     final response = await http
//         .post(
//           url,
//           headers: {
//             "Content-Type": "application/json",
//             "Accept": "application/json",
//           },
//           body: jsonEncode(data),
//         )
//         .timeout(
//           const Duration(seconds: 10),
//         );
//
//     if (response.statusCode == 200) {
//       return Right(jsonDecode(response.body));
//     } else {
//       return Left(
//         ServerFailure("${response.statusCode}: ${response.reasonPhrase}"),
//       );
//     }
//   } on TimeoutException {
//     return const Left(
//       TimeoutFailure("Request timed out, silahkan coba lagi."),
//     );
//   } on SocketException {
//     return const Left(
//       ConnectionFailure("Tidak ada koneksi internet."),
//     );
//   } on HttpException {
//     return const Left(ServerFailure("Kesalahan pada server."));
//   } catch (e) {
//     return Left(ServerFailure("Error tidak diketahui: $e"));
//   }
// }
}
