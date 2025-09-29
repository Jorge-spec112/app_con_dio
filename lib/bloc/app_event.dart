// lib/bloc/app_event.dart
abstract class AppEvent {}

class LoginEvent extends AppEvent {
  final String email;
  final String password;
  LoginEvent(this.email, this.password);
}

class FetchUsersEvent extends AppEvent {}
