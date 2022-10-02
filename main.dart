import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatefulWidget {
  HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Text('Home'),
            ),
            body: const FirstScreen()));
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var btnState;
    var btnAction;

    return Container(
      child: Center(
        child: ElevatedButton(
            child: Text('TEST'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              padding: EdgeInsets.all(30.0),
              // side: BorderSide(color: Colors.yellow, width: 5),
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontStyle: FontStyle.normal),
            ),
            onPressed: () async {
              // var btnOn = '/RELAY=ON';
              // var btnOff = '/RELAY=OFF';

              if (btnState == 'ON') {
                // print('tgh on, klik utk off');
                btnAction = '/RELAY=OFF';
                btnState = 'OFF';
              } else if (btnState == 'OFF') {
                // print('tgh off, klik utk on');
                btnAction = '/RELAY=ON';
                btnState = 'ON';
              } else {
                // print('baru start');
                btnAction = '/RELAY=OFF';
                btnState = 'OFF';
              }

              var url = Uri.http('192.168.1.163', btnAction); //tukar ip esp anda

              var response = await http.get(url);

              if (response.statusCode == 200) {
                print('ok');
              } else {
                print('Request failed with status: ${response.statusCode}.');
              }
            }),
      ),
    );
  }
}

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('New Screen'),
      ),
      body: Center(child: Text('This is your new screen')),
    );
  }
}
