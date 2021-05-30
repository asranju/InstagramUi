import 'package:fluttermachinetest/Models/InstaModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Apicalls {
  static Future<List<InstaModel>?> getUserdata() async {
    Map<String, String> mainheader = {
      "Content-type": "application/json",
    };
    final response = await http.get(
      'https://hiit.ria.rocks/videos_api/cdn/com.rstream.crafts?versionCode=40&lurl=Canvas%20painting%20ideas',
      headers: mainheader,
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((Data) => new InstaModel.fromJson(Data)).toList();
    } else {
      return null;
    }
  }
}
