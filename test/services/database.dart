import 'dart:convert';

import 'package:http/http.dart' as http;

import '../secrets.dart';


class ProfileDatabase{
  add(newProfilData) async {
    var url = Uri.parse(databaseUrl + databasePathNewProfil);
    var data = {
      "id": newProfilData["id"],
      "name": newProfilData["name"],
    };

    await http.post(url, body: json.encode(data));
  }

  getData(queryStart, queryEnd) async{
    var url = Uri.parse(databaseUrl + databasePathProfilGetData);

    var res = await http.post(url,
        body: json.encode(
            {"queryStart": queryStart, "queryEnd": queryEnd, "table": "profils"}));
    dynamic responseBody = res.body;

    responseBody = jsonDecode(responseBody);

    return responseBody;
  }

  update(queryStart, queryEnd) async {
    var url = Uri.parse(databaseUrl + databasePathProfilUpdate);

    await http.post(url,
        body: json.encode(
            {"table": "profils", "queryStart": queryStart, "queryEnd": queryEnd}));
  }
}