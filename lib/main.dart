
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fairytales/view/screens/authenticationSc.dart';
import 'package:flutter/material.dart';

void main(){

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: AuthenticationScreen(),
    );
  }
}
