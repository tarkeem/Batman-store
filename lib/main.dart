import 'package:audioplayers/audioplayers.dart';
import 'package:fairytales/view/screens/authenticationSc.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  var player=AudioCache();
  await player.load('assets/song.mp3');
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
