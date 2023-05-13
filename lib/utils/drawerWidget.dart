import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iot_ap/screens/home_screen.dart';
import 'package:iot_ap/screens/itemscreen/item1.dart';
import 'package:iot_ap/screens/itemscreen/item3.dart';
import 'package:iot_ap/utils/next_screen.dart';
import 'package:provider/provider.dart';

import '../providers/sign_in_providers.dart';
import '../screens/itemscreen/item2.dart';
import '../screens/itemscreen/item4.dart';
import '../screens/login_screen.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({super.key});

  final padding = EdgeInsets.symmetric(horizontal: 12);
  @override
  Widget build(BuildContext context) {
    final sp = context.watch<SignInProvider>();

    final name = sp.name;
    final email = sp.email;
    final urlImage = sp.imageUrl;
    return Drawer(
      //backgroundColor: Color.fromARGB(255, 152, 150, 143),
      child: Material(
        color: Color.fromARGB(255, 152, 150, 143),
        child: ListView(
          //padding: padding,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            buildHeader(name: name, email: email, urlImage: urlImage),
            TextButton(
                onPressed: () {
                  sp.userSignOut();
                  nextScreenReplace(context, LoginScreen());
                },
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Sign out",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  buildMenuItem(
                      text: 'All Items',
                      icon: Icons.smart_toy,
                      onClicked: () => selectedItem(context, 0)),
                  SizedBox(
                    height: 18,
                  ),
                  buildMenuItem(
                      text: 'Item 1',
                      icon: Icons.smart_toy,
                      onClicked: () => selectedItem(context, 1)),
                  SizedBox(
                    height: 18,
                  ),
                  buildMenuItem(
                      text: 'Item 2',
                      icon: Icons.smart_toy,
                      onClicked: () => selectedItem(context, 2)),
                  SizedBox(
                    height: 18,
                  ),
                  buildMenuItem(
                      text: 'Item 3',
                      icon: Icons.smart_toy,
                      onClicked: () => selectedItem(context, 3)),
                  SizedBox(
                    height: 18,
                  ),
                  buildMenuItem(
                      text: 'Item 4',
                      icon: Icons.smart_toy,
                      onClicked: () => selectedItem(context, 4)),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        nextScreen(context, HomeScreen());
        break;
      case 1:
        nextScreen(context, Item1());
        break;
      case 2:
        nextScreen(context, Item2());
        break;
      case 3:
        nextScreen(context, Item3());
        break;
      case 4:
        nextScreen(context, Item4());
        break;
    }
  }

  buildHeader({
    required String? name,
    required String? email,
    required String? urlImage,

    // required VoidCallback onClicked,
  }) {
    return Container(
      padding: padding.add(
        EdgeInsets.symmetric(vertical: 20),
      ),
      child: Row(children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(urlImage!),
          radius: 20,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name!,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              email!,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        )
      ]),
    );
  }
}
