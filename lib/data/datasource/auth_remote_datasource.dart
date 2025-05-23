import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/common/constants/variables.dart';
import 'package:ecommerce_app/data/model/request/login_request_model.dart';
import 'package:ecommerce_app/data/model/responses/auth_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  // Future<Either<String, AuthResponseModel>> register(
  //     RegisterRequestModel data) async {
  //   final headers = {'Content-Type': 'application/json'};
  //   final response = await http.post(
  //     Uri.parse('${Variables.baseUrl}/api/auth/local/register'),
  //     body: data.toJson(),
  //     headers: headers,
  //   );

  //   if (response.statusCode == 200) {
  //     return right(AuthResponseModel.fromJson(response.body));
  //   } else {
  //     return left('Failed Register');
  //   }
  // }

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel data) async {
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/login/create_token'),
      body: data.toJson(),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }
}
