import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iot_ap/providers/sign_in_providers.dart';
import 'package:iot_ap/screens/controller_screen.dart/iot_wifi_controller.dart';
import 'package:iot_ap/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:iot_ap/screens/splash_screen.dart';
import 'package:iot_ap/providers/internet_provider.dart';
import 'package:iot_ap/providers/internet_provider.dart';

void main() async {
  // initialize the application
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => SignInProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => InternetProvider()),
        ),
      ],
      child: const MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
