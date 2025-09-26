import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();

  Map<String, dynamic>? _userData;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final response = await _apiService.fetchData();
      if (response.statusCode == 200) {
        setState(() {
          _userData = response.data;
        });
      } else {
        setState(() {
          _error = "Error al cargar datos: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        _error = "Error en la conexión: $e";
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : _error != null
            ? Text(_error!, style: const TextStyle(color: Colors.red))
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network("https://picsum.photos/200"),

                  const SizedBox(height: 20),
                  Text(
                    "Nombre: ${_userData?['name'] ?? 'Desconocido'}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Email: ${_userData?['email'] ?? 'N/A'}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
      ),
    );
  }
}
