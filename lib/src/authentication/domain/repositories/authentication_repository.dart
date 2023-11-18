import 'package:dartz/dartz.dart';
import 'package:standard/core/errors/failure.dart';
import 'package:standard/core/utils/typedef.dart';
import 'package:standard/src/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  ResultFuture<List<User>> getUsers();
}
