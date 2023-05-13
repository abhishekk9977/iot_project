import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iot_ap/screens/controller_screen.dart/ap_controller_screen.dart';
import 'package:iot_ap/screens/controller_screen.dart/iot_controller_screen.dart';
import 'package:iot_ap/screens/home_screen.dart';

import '../../utils/next_screen.dart';

class IotwifiScreen extends StatefulWidget {
  const IotwifiScreen({
    super.key,
  });

  @override
  State<IotwifiScreen> createState() => _IotwifiScreenState();
}

class _IotwifiScreenState extends State<IotwifiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 152, 150, 143),
        title: Text(
          "Iot-Wifi",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          left: 80,
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                print("dmskjdns");
                nextScreen(context, IotScreen());
              },
              child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 152, 150, 143),
                      // border: Border.all(),
                      borderRadius: BorderRadius.circular(14)),
                  child: Center(
                      child: Text(
                    "Control via IOT",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ))),
            ),
            SizedBox(
              height: 90,
            ),
            InkWell(
              onTap: () {
                print("dmskjdns");
                nextScreen(context, ApScreen());
              },
              child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 152, 150, 143),
                      // border: Border.all(),
                      borderRadius: BorderRadius.circular(14)),
                  child: Center(
                      child: Text(
                    "Control via AP",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
