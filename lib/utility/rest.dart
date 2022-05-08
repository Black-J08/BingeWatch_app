// ignore_for_file: unused_element

import 'package:http/http.dart' as http;

const String baseEndpoint = 'http://127.0.0.1:8000';

Future<http.Response> post(String endpoint, Map _body) async {
  var url = Uri.parse(baseEndpoint + endpoint);
  var response = await http.post(url, body: _body);
  return response;
}
