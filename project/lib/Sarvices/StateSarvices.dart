import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/Model/worldStateData.dart';
import 'package:project/Sarvices/Utility/appUrl.dart';

class statesarvices {
  Future<WorldStateData> fatchWorldStateRecord() async {
    final responce = await http.get(Uri.parse(appUrl.WorldStateApi));

    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      return WorldStateData.fromJson(data);
    } else {
      throw Exception('error');
    }
  }

  // we are not making model for country list
  Future<List<dynamic>> CountriesList() async {
    var data;
    final responce = await http.get(Uri.parse(appUrl.countryslist));

    if (responce.statusCode == 200) {
      data = jsonDecode(responce.body);
      return data;
    } else {
      throw Exception('error');
    }
  }
}
