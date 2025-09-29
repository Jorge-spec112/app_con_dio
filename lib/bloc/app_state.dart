// lib/bloc/app_state.dart

import 'package:flutter_application_1/modelo/modelo.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class AppLoading extends AppState {}

class LoginSuccess extends AppState {
  final List<UserModel> users;
  LoginSuccess(this.users);
}

class UsersLoaded extends AppState {
  final List<UserModel> users;
  UsersLoaded(this.users);
}

class AppError extends AppState {
  final String message;
  AppError(this.message);
}
