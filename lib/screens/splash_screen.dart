import 'dart:async';

import 'package:iot_ap/providers/sign_in_providers.dart';
import 'package:iot_ap/screens/home_screen.dart';
import 'package:iot_ap/screens/login_screen.dart';
import 'package:iot_ap/utils/config.dart';
import 'package:iot_ap/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // init state
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();
    // create a timer of 2 seconds
    Timer(
      const Duration(seconds: 2),
      () {
        sp.isSignedIn == false
            ? nextScreen(context, const LoginScreen())
            : nextScreen(context, const HomeScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Image(
          image: AssetImage(Config.app_icon),
          height: 80,
          width: 80,
        )),
      ),
    );
  }
}
