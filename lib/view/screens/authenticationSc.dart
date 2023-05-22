import 'dart:async';

import 'package:batman/view/widgets/batmanButton.dart';
import 'package:batman/view/widgets/batmanCityPic.dart';
import 'package:batman/view/widgets/batmanTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _LogoAnimation;
  late Animation _BatManAnimation;
  late Animation _ButtonAnimation;
  late Animation _TextAnimation;
  late Animation _TextAnimation2;
  //...........................................................

  late AnimationController _animationController2;
  late Animation _LogInAnimation;
  late Animation _CityAnimation;
  late Animation _LoginForm;
  late Animation _batmanBack;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _LogoAnimation = Tween<double>(begin: 30.0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.0, 0.25)));
    _BatManAnimation = Tween<double>(begin: 30.0, end: 1).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.7, 0.9)));
    _ButtonAnimation = Tween<double>(begin: -2, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.55, 0.65)));
    _TextAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.4, 0.5)));
    _TextAnimation2 = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.3, 0.35)));
   

   
    //.........................................................
    _animationController2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _LogInAnimation = CurvedAnimation(
        parent: _animationController2, curve: Interval(0.0, 0.3));
        _batmanBack=CurvedAnimation(
        parent: _animationController2, curve: Interval(0.4,0.6 ));
    _CityAnimation = CurvedAnimation(
        parent: _animationController2, curve: Interval(0.6, 0.8));
    _LoginForm=CurvedAnimation(
        parent: _animationController2, curve: Interval(0.8, 1.0));


         Timer(Duration(seconds: 5), () {
      
    },);
    
  }

  bool signedState=false;
  @override
  Widget build(BuildContext context) {
     
    var DeviceSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
        body: AnimatedBuilder(
          animation: _animationController2,
          builder: (context, child) => AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/batman_background.png',
                    )),
                Positioned(
                    top: (20*(_LogInAnimation.value-(_batmanBack.value*3))).toDouble(),
                    left: 0,
                    right: 0,
                    child: Transform.scale(
                        scale: _BatManAnimation.value,
                        child: GestureDetector(
                          onTap: () {
                            _animationController.forward();
                          },
                          child: Image.asset(
                            'assets/images/batman_alone.png', /*scale: ,*/
                          ),
                        ))),
                Positioned(
                    top: DeviceSize.height *0.3,
                    left: 0,
                    right: 0,
                    child: BatmanCityOic(_CityAnimation.value)),
                Positioned(
                  top: (DeviceSize.height * 0.5 + 40),
                  child: Opacity(
                    opacity: (1 - _LogInAnimation.value).toDouble(),
                    child: Opacity(
                      opacity: _TextAnimation.value,
                      child: Text('Welcome To \nBatMan Store',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.aladin(color: Colors.white,fontSize: 30)),
                    ),
                  ),
                ),
                Positioned(
                    bottom: (_ButtonAnimation.value * 50) -
                        (200 * _LogInAnimation.value),
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          BatManButton(
                              text: 'SignIn',
                              onTap: () {
                                print('object');
                                _animationController2.forward();
                                setState(() {
                                  signedState=true;
                                });
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          BatManButton(text: 'SignUp', onTap: () async {}),
                        ],
                      ),
                    )),
                Positioned(
                    top: (DeviceSize.height * 0.5) +
                        (40 * _TextAnimation2.value),
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: (1 - _LogInAnimation.value).toDouble(),
                      child: Transform.scale(
                        scale: _LogoAnimation.value,
                        child: Image.asset(
                          'assets/images/batman_logo.png',
                          height: 35,
                        ),
                      ),
                    )),
                
                
                if(signedState)
                Positioned(

                  //dont put expanded in  stack
                  
                  bottom: DeviceSize.height * 0.10*_LoginForm.value,
                  
                  //without mentioning left,right parameter ,it will generate error
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: _LoginForm.value,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BatManButton(text:'Get Access',onTap: () {
                            
                          },),
                          SizedBox(height: 20,),
                          BatManTextField(Label: 'name'),
                          SizedBox(height: 20,),
                          BatManTextField(Label: 'password')
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
