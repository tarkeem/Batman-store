import 'dart:async';

import 'package:batman/view/screens/authenticationSc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>AuthenticationScreen() ,));
    },);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}