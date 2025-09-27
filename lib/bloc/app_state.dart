abstract class AppState {}

class AppInitial extends AppState {}

class AppLoading extends AppState {}

class LoginSuccess extends AppState {}

class DataLoaded extends AppState {
  final Map<String, dynamic> data;
  DataLoaded(this.data);
}

class AppError extends AppState {
  final String message;
  AppError(this.message);
}
