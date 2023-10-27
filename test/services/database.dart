import 'dart:convert';

import 'package:http/http.dart' as http;


class ProfileDatabase{
  add() async {
    var url = Uri.parse(databaseUrl);
    var data = {
      "id": profilData["id"],
      "name": profilData["name"],
      "email": profilData["email"],
      "land": profilData["land"],
      "interessen": json.encode(profilData["interessen"]),
      "kinder": json.encode(profilData["kinder"]),
      "latt": profilData["latt"],
      "longt": profilData["longt"],
      "ort": profilData["ort"],
      "reiseart": profilData["reiseart"],
      "sprachen": json.encode(profilData["sprachen"]),
      "token": profilData["token"],
      "lastLogin": profilData["lastLogin"],
      "aboutme": profilData["aboutme"],
      "besuchteLaender": json.encode(profilData["besuchteLaender"]),
    };

    await http.post(url, body: json.encode(data));
  }

  getData(){

  }

  update(){

  }
}