import 'package:shared_preferences/shared_preferences.dart';

import '../model/responses/auth_response_model.dart';

class AuthLocalDataSource {
  // save auth data
  Future<void> saveAuthData(AuthResponseModel model) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('auth', model.toJson());
  }

  // logout
  Future<void> removeData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth');
  }

  // get token
  Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(authJson);
    return authData.accessToken ?? '';
  }

  // get user
  Future<User> getUser() async {
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(authJson);
    return authData.user!;
  }

  // check login
  Future<bool> isLogin() async {
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    return authJson.isNotEmpty;
  }
}
