// lib/views/users_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/app_bloc.dart';
import '../bloc/app_event.dart';
import '../bloc/app_state.dart';
import '../modelo/modelo.dart';

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
              padding: const EdgeInsets.all(20),
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final UserModel user = state.users[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Avatar grande y centrado
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue.shade200,
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Nombre debajo
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    // Email debajo
                    Text(
                      user.email,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30), // espacio entre usuarios
                  ],
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
