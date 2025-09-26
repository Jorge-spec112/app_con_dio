import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com", // Cambia por tu API
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  // LOGIN -> POST
  Future<Response> login(String email, String password) async {
    final response = await _dio.post(
      "/posts", // Ejemplo, cambia por tu endpoint de login real
      data: {"email": email, "password": password},
    );
    return response;
  }

  // GET -> Datos JSON
  Future<Response> fetchData() async {
    final response = await _dio.get("/users/1"); // Ejemplo, un solo user
    return response;
  }
}
