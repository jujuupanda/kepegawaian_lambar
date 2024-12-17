import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json["token"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
    };
  }

  AuthEntity toEntity() {
    return AuthEntity(
      token: token,
    );
  }

  static AuthModel fromEntity(AuthEntity authEntity) {
    return AuthModel(
      token: authEntity.token,
    );
  }

  AuthModel copyWith(Map<String, dynamic> authModel) {
    return AuthModel(
      token: authModel["token"] ?? token,
    );
  }
}
