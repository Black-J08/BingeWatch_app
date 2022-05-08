import 'package:binge_watch/utility/rest.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

const storage = FlutterSecureStorage();

Future<bool> login(String email, String password) async {
  var body = {'email': email, 'password': password};
  var response = await post('/auth/login/', body);
  var data = json.decode(response.body);
  if (response.statusCode == 200) {
    var userData = data['user'];
    await storage.write(key: "access_token", value: data['access_token']);
    await storage.write(key: "refresh_token", value: data['refresh_token']);
    await storage.write(key: "username", value: userData['username']);
    await storage.write(key: "email", value: userData['email']);
    await storage.write(key: "first_name", value: userData['first_name']);
    await storage.write(key: "last_name", value: userData['last_name']);
    return true;
  }
  return false;
}

Future<bool> verifyToken() async {
  bool tokenAvailable = await storage.containsKey(key: "access_token");
  if (tokenAvailable) {
    String? token = await storage.read(key: "access_token");
    var body = {"token": token};
    var response = await post('/auth/token/verify/', body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return refreshToken();
    }
  }
  return false;
}

Future<bool> refreshToken() async {
  bool refreshTokenAvailable = await storage.containsKey(key: "refresh_token");
  if (refreshTokenAvailable) {
    String? _refreshToken = await storage.read(key: "refresh_token");
    var body = {"refresh": _refreshToken};
    var response = await post('/auth/token/refresh/', body);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      await storage.write(key: "access_token", value: data['access_token']);
      return true;
    }
  }
  return false;
}
