// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/api_service.dart';
import 'package:flutter_application_1/view/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/app_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => ApiRepository(),
      child: BlocProvider(
        create: (context) => AppBloc(context.read<ApiRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        ),
      ),
    );
  }
}
