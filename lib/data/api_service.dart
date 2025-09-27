import 'package:dio/dio.dart';

class ApiRepository {
  final Dio _dio = Dio();

  Future<void> login(String email, String password) async {
    final response = await _dio.post(
      "https://jsonplaceholder.typicode.com/posts",
      data: {"email": email, "password": password},
    );

    if (response.statusCode != 201) {
      throw Exception("Error en login");
    }
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response = await _dio.get(
      "https://jsonplaceholder.typicode.com/photos/1",
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Error al obtener datos");
    }
  }
}
