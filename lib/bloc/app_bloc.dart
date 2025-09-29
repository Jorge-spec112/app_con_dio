// lib/bloc/app_bloc.dart
import 'package:flutter_application_1/data/api_service.dart';
import 'package:flutter_application_1/modelo/modelo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final ApiRepository apiRepository;
  final List<UserModel> _registeredUsers = [];

  AppBloc(this.apiRepository) : super(AppInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AppLoading());
      try {
        await apiRepository.login(event.email, event.password);

        // crear usuario desde login
        final newUser = UserModel(
          name: event.email.split('@')[0], // usa lo antes del @ como nombre
          email: event.email,
        );

        _registeredUsers.add(newUser);

        emit(LoginSuccess(List.from(_registeredUsers)));
      } catch (e) {
        emit(AppError(e.toString()));
      }
    });

    on<FetchUsersEvent>((event, emit) async {
      emit(AppLoading());
      try {
        emit(UsersLoaded(List.from(_registeredUsers)));
      } catch (e) {
        emit(AppError(e.toString()));
      }
    });
  }
}
