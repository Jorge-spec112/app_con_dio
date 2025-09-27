import 'package:flutter_application_1/data/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final ApiRepository apiRepository;

  AppBloc(this.apiRepository) : super(AppInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AppLoading());
      try {
        await apiRepository.login(event.email, event.password);
        emit(LoginSuccess());
      } catch (e) {
        emit(AppError(e.toString()));
      }
    });

    on<FetchDataEvent>((event, emit) async {
      emit(AppLoading());
      try {
        final data = await apiRepository.fetchData();
        emit(DataLoaded(data));
      } catch (e) {
        emit(AppError(e.toString()));
      }
    });
  }
}
