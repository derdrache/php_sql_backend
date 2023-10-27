import 'package:flutter/material.dart';

import 'services/database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  addProfil(){
    var newProfil = {
      "name": "DevDrache",
      "age": "30"
    };

    ProfileDatabase().add(newProfil);
  }

  updateProfil(){
    ProfileDatabase().update("name = 'DevDracheTest'", "where name = 'DevDrache'");
  }

  getAllProfils() async {
    var allProfils = await ProfileDatabase().getData("*", "");
    print(allProfils);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FloatingActionButton.extended(onPressed: addProfil, label: const Text("Add Profil"),),
          const SizedBox(height: 30,),
          FloatingActionButton.extended(onPressed: updateProfil, label: const Text("Update Profil"),),
          const SizedBox(height: 30,),
          FloatingActionButton.extended(onPressed: getAllProfils, label: const Text("get all profils"),),
        ],),
      ),
    );
  }
}

