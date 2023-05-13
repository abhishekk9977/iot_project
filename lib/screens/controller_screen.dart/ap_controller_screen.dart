import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ApScreen extends StatefulWidget {
  const ApScreen({super.key});

  @override
  State<ApScreen> createState() => _ApState();
}

class _ApState extends State<ApScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 152, 150, 143),
        title: Text("Control via AP"),
      ),
    );
  }
}
