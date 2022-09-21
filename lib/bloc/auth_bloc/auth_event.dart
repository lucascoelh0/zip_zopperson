part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GoogleSignInRequestedEvent extends AuthEvent {}

class SignOutRequestedEvent extends AuthEvent {}
