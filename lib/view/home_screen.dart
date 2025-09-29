// lib/views/users_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modelo/modelo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/app_bloc.dart';
import '../bloc/app_event.dart';
import '../bloc/app_state.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AppBloc>().add(FetchUsersEvent());

    return Scaffold(
      appBar: AppBar(title: const Text("Usuarios Registrados")),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is AppLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UsersLoaded) {
            if (state.users.isEmpty) {
              return const Center(child: Text("No hay usuarios registrados"));
            }
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final UserModel user = state.users[index];
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            );
          } else if (state is AppError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
