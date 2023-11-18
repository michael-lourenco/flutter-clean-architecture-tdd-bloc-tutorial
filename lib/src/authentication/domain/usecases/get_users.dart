import 'package:standard/core/usecase/usecase.dart';
import 'package:standard/core/utils/typedef.dart';
import 'package:standard/src/authentication/domain/entities/user.dart';
import 'package:standard/src/authentication/domain/repositories/authentication_repository.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  const GetUsers(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}
