import 'dart:convert';

import 'package:http/http.dart' as http;

import '../secrets.dart';


class ProfilDatabase{
  add(newProfilData) async {
    var url = Uri.parse(databaseUrl + databasePathNewProfil);
    var data = {
      "name": newProfilData["name"].replaceAll("'", "''"),
      "age": newProfilData["age"]
    };

    await http.post(url, body: json.encode(data));
  }

  getData(queryStart, queryEnd) async{
    var url = Uri.parse(databaseUrl + databasaePathGetData);

    var res = await http.post(url, body: json.encode({
      "table": "profils",
      "queryStart": queryStart,
      "queryEnd": queryEnd
    }));

    dynamic responseBody = res.body;
    responseBody = json.decode(responseBody);

    return responseBody;
  }

  update(queryStart, queryEnd) async {
    var url = Uri.parse(databaseUrl + databasePathUpdate);

    await http.post(url, body: json.encode({
      "table": "profils",
      "queryStart": queryStart,
      "queryEnd": queryEnd
    }));
  }
}