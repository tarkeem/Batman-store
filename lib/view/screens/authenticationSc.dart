import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fairytales/view/widgets/batmanButton.dart';
import 'package:fairytales/view/widgets/batmanCityPic.dart';
import 'package:fairytales/view/widgets/batmanTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
    _animationController.forward();
    //.........................................................
    _animationController2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _LogInAnimation = CurvedAnimation(
        parent: _animationController2, curve: Interval(0.0, 0.3));
    _CityAnimation = CurvedAnimation(
        parent: _animationController2, curve: Interval(0.35, 0.7));
  }

  @override
  Widget build(BuildContext context) {
    var DeviceSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
        body: AnimatedBuilder(
          animation:_animationController2 ,
          builder:(context, child) => AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset('assets/batman_background.png')),
                Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Transform.scale(
                        scale: _BatManAnimation.value,
                        child: Image.asset(
                          'assets/batman_alone.png', /*scale: ,*/
                        ))),
                Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: BatmanCityOic(_CityAnimation.value)),
                Positioned(
                  top: (DeviceSize.height * 0.5 + 40),
                  child: Opacity(
                    opacity: _TextAnimation.value,
                    child: Text('Welcome To \nBatMan Store',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: Colors.yellow)),
                  ),
                ),
                Positioned(
                    bottom: (_ButtonAnimation.value * 50)-(200*_LogInAnimation.value),
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
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          BatManButton(text: 'SignUp', onTap: () async {}),
                        ],
                      ),
                    )),
                Positioned(
                    top: (DeviceSize.height * 0.5) + (40 * _TextAnimation2.value),
                    left: 0,
                    right: 0,
                    child: Transform.scale(
                      scale: _LogoAnimation.value,
                      child: Image.asset(
                        'assets/batman_logo.png',
                        height: 35,
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
