// lib/repository/api_repository.dart
import 'package:dio/dio.dart';

class ApiRepository {
  final Dio _dio = Dio();

  // Login POST
  Future<void> login(String email, String password) async {
    final response = await _dio.post(
      "https://jsonplaceholder.typicode.com/posts",
      data: {"email": email, "password": password},
    );
    if (response.statusCode != 201) {
      throw Exception("Error en login");
    }
  }

  // Obtener usuarios GET desde mocky.io
  Future<List<dynamic>> fetchUsers() async {
    final response = await _dio.get(
      "https://mocki.io/v1/e83a6015-ab9b-465d-bab4-f3464d3e065e",
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Error al cargar usuarios");
    }
  }
}
