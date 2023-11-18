import 'package:dartz/dartz.dart';
import 'package:standard/core/errors/exceptions.dart';
import 'package:standard/core/errors/failure.dart';
import 'package:standard/core/utils/typedef.dart';
import 'package:standard/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:standard/src/authentication/domain/entities/user.dart';
import 'package:standard/src/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  const AuthenticationRepositoryImplementation(this._remoteDataSource);

  final AuthenticationRemoteDataSource _remoteDataSource;

  @override
  ResultVoid createUser(
      {required String createdAt,
      required String name,
      required String avatar}) async {
    // Test-Driven Development
    // call the remote data source
    // make sure that it returns the proper data if there is no exception
    // check if the method returns the proper data
    // // check if when the remoteDataSource throws an exception, we return a
    // failure and if it doesn't throw and exception, we return a
    // failure

    try {
      await _remoteDataSource.createUser(
          createdAt: createdAt, name: name, avatar: avatar);

      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<User>> getUsers() async {
    try {
      final result = await _remoteDataSource.getUsers();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
