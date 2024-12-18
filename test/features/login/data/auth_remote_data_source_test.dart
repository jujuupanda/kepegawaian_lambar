// import 'dart:convert';
//
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
// import 'package:initial_setup_for_flutter/core/utils/api_helper.dart';
// import 'package:initial_setup_for_flutter/features/login/domain/use_cases/login_use_case.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// @GenerateMocks([http.Client])
// class MockApiHelper extends Mock implements ApiHelper {}
//
// void main() {
//   final mockApiHelper = MockApiHelper();
//   const endpoint = "/api/login";
//   const params = LoginParam(username: "username", password: "password");
//   final data = {
//     "email": params.username,
//     "password": params.password,
//   };
//   final response = {
//     "token": "token",
//   };
//   loginRequest() {
//     mockApiHelper.requestHandler(
//       () => http.post(
//         Uri.parse("https://reqres.in$endpoint"),
//         headers: {
//           "Content-Type": "application/json",
//           "Accept": "application/json",
//         },
//         body: jsonEncode(data),
//       ),
//     );
//   }
//
//   test("description", () async {
//     // when(() => mockApiHelper.loginRequest(endpoint, data))
//     //     .thenAnswer((_) async => Right(response));
//     when(() => mockApiHelper
//             .requestHandler(loginRequest as Future<http.Response> Function()))
//         .thenAnswer((_) => Right(response));
//     final result = await mockApiHelper.loginRequest(endpoint, data);
//   });
// }
