import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../model/responses/vehicle_response_model.dart';
import 'auth_local_datasource.dart';

class VehicleRemoteDatasource {
  final AuthLocalDataSource authLocalDataSource;

  VehicleRemoteDatasource(this.authLocalDataSource);

  Future<Either<String, List<VehicleResponseModel>>> getVehicles() async {
    // Ambil token dari AuthLocalDataSource
    final token = await authLocalDataSource.getToken();

    if (token == null || token.isEmpty) {
      return left('Unauthorized: Token is missing');
    }

    // Sisipkan apiKey di query parameter
    final uri = Uri.parse('https://api.server-gps.com/api/device')
        .replace(queryParameters: {'apikey': token});

    // Lakukan request ke API
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      // Parsing JSON response ke List<VehicleResponseModel>
      final List<dynamic> body = json.decode(response.body);
      final vehicles =
          body.map((e) => VehicleResponseModel.fromMap(e)).toList();
      return right(vehicles);
    } else {
      return left('Server Error: ${response.statusCode}');
    }
  }
}
