import 'dart:convert';

import 'package:lesson44/models/user.dart';
import 'package:http/http.dart' as http;

class UsersController {
  final List<User> _list = [];

  List<User> get list {
    return [..._list];
  }

  Future<void> getUsers() async {
    Uri url = Uri.parse("https://reqres.in/api/users?page=1");
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception("Not found");
      }
      List<Map<String, dynamic>> data =
          jsonDecode(response.body)['data'].cast<Map<String, dynamic>>();
      for (var user in data) {
        _list.add(User.fromJson(user));
      }
    } catch (e) {
      print(e);
    }
  }
}
