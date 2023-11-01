import 'package:aarpluginflutter/untitled1.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

// class MyData {
//   final String name;
//   final String email;
//   final String number;
//
//   MyData(this.name, this.email, this.number);
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _untitled1Plugin = Untitled1();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  Future<void> initPlatformState() async {
    print('---->>>> 1');
    Map<String, String> dataToPass = {
      'key1': nameController.text,
      'key2': emailController.text,
      'key3': numberController.text,
    };
    print('---->>>> 2');
    String platformVersion;
    print('---->>>> 3');
    try {
      print('---->>>> 4');
      platformVersion = await _untitled1Plugin.getPlatformVersion(dataToPass) ??
          'Unknown platform version';
      print('---->>>> 5');
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter aar app'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    hintText: 'name'
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'email'
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: numberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'mobile number'
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Center(
              //   child: GestureDetector(
              //     onTap: () {
              //       initPlatformState();
              //     },
              //     child: Container(
              //       color: Colors.blue,
              //       child: Center(
              //         child: Text('Running on: $_platformVersion\n'),
              //       ),
              //     ),
              //   ),
              // ),
              ElevatedButton(
                onPressed: () {
                  initPlatformState();
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
