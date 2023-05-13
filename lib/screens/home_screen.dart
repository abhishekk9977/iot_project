// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flurry_navigation/flurry_navigation.dart';
import 'package:iot_ap/Models/dataModel.dart';
import 'package:iot_ap/screens/controller_screen.dart/iot_wifi_controller.dart';
import 'package:iot_ap/screens/controller_screen.dart/jsonDataController.dart';
import 'package:iot_ap/screens/login_screen.dart';
import 'package:iot_ap/utils/config.dart';
import 'package:iot_ap/utils/drawerWidget.dart';
import 'package:iot_ap/utils/next_screen.dart';
import 'package:provider/provider.dart';
import 'package:iot_ap/providers/sign_in_providers.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // change read to watch!!!!
    final sp = context.watch<SignInProvider>();

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 152, 150, 143),
        centerTitle: true,
        title: Text(
          "Divyansh IOTAP",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(children: [
            Flexible(
              // child: GridView.builder(
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 3,
              //   ),
              //   itemCount: 15,
              //   itemBuilder: (BuildContext context, int index) {
              // return GestureDetector(
              //   onTap: (() {
              //     nextScreenReplace(context, IotwifiScreen());
              //   }),
              //child:
              child: FutureBuilder(
                future: readJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    print("ndcn");
                    return SnackBar(content: Text("${data.error}"));
                  } else if (data.hasData) {
                    var items = data.data as List<DataModel>;
                    return GridView.builder(
                      itemCount: items == null ? 0 : items.length,
                      itemBuilder: (context, index) {
                        //SliverGridDelegateWithMaxCrossAxisExtent();
                        return InkWell(
                            onTap: () {
                              nextScreen(context, IotwifiScreen());
                            },
                            splashColor: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                items[index].name.toString(),
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        items[index].imageUrl.toString(),
                                      ),
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.7),
                                          BlendMode.dstATop),
                                      fit: BoxFit.cover),
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.white.withOpacity(0),
                                        Colors.white
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  borderRadius: BorderRadius.circular(15)),
                            ));
                      },
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250,
                        childAspectRatio: 0.9,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                    );

                    // ListView.builder(
                    //     itemCount: items == null ? 0 : items.length,
                    //     itemBuilder: (context, index) {
                    //       return Card(
                    //           elevation: 5,
                    //           margin: EdgeInsets.symmetric(
                    //               horizontal: 10, vertical: 6),
                    //           child: Container(
                    //               padding: EdgeInsets.all(8),
                    //               child: Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.center,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.center,
                    //                   children: [
                    //                     Container(
                    //                       width: 90,
                    //                       height: 90,
                    //                       child: Image(
                    //                         image: NetworkImage(
                    //                           items[index].imageUrl.toString(),
                    //                         ),
                    //                         fit: BoxFit.fill,
                    //                       ),
                    //                     ),
                    //                     Expanded(
                    //                       child: Container(
                    //                         padding: EdgeInsets.only(
                    //                             bottom: 8, left: 25),
                    //                         child: Column(
                    //                           mainAxisAlignment:
                    //                               MainAxisAlignment.center,
                    //                           crossAxisAlignment:
                    //                               CrossAxisAlignment.start,
                    //                           children: [
                    //                             // Padding(
                    //                             //   padding: EdgeInsets.only(
                    //                             //       left: 8, right: 8),
                    //                             //   child: Text(
                    //                             //     items[index]
                    //                             //         .roboNum
                    //                             //         .toString(),
                    //                             //     style: TextStyle(
                    //                             //         fontSize: 16,
                    //                             //         fontWeight:
                    //                             //             FontWeight.bold),
                    //                             //   ),
                    //                             // ),
                    //                             Padding(
                    //                               padding: EdgeInsets.only(
                    //                                   left: 8, right: 8),
                    //                               child: Text(
                    //                                 items[index]
                    //                                     .name
                    //                                     .toString(),
                    //                                 style: TextStyle(
                    //                                     fontSize: 16,
                    //                                     fontWeight:
                    //                                         FontWeight.bold),
                    //                               ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     )
                    //                   ])));
                    //     });
                  } else {
                    // ignore: prefer_const_constructors
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
          ])),
    );
    // return FlurryNavigation(
    //     //expandIcon: Image.asset(Config.app_icon),
    //     );
    //Scaffold(
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: <Widget>[
    //       Align(
    //         alignment: Alignment.topRight,
    //         child: CircleAvatar(
    //           backgroundColor: Colors.white,
    //           backgroundImage: NetworkImage("${sp.imageUrl}"),
    //           radius: 50,
    //         ),
    //       ),
    //       const SizedBox(
    //         height: 20,
    //       ),
    //       // Text(
    //       //   "Welcome ${sp.name}",
    //       //   style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    //       // ),
    //       // const SizedBox(
    //       //   height: 10,
    //       // ),
    //       // Text(
    //       //   "${sp.email}",
    //       //   style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    //       // ),
    //       // const SizedBox(
    //       //   height: 10,
    //       // ),
    //       // Text(
    //       //   "${sp.uid}",
    //       //   style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    //       // ),
    //       // const SizedBox(
    //       //   height: 10,
    //       // ),
    //       // const SizedBox(
    //       //   height: 20,
    //       // ),
    //       // ElevatedButton(
    //       //   onPressed: () {
    //       //     sp.userSignOut();
    //       //     nextScreenReplace(context, const LoginScreen());
    //       //   },
    //       //   child: const Text(
    //       //     "SIGNOUT",
    //       //     style: TextStyle(
    //       //       color: Colors.white,
    //       //     ),
    //       //   ),
    //       // )
    //     ],
    //   ),
    //   // body: Expanded(
    //   //   child: Column(
    //   //     children: [
    //   //       Align(
    //   //         alignment: Alignment.topRight,
    //   //         child: CircleAvatar(
    //   //           backgroundColor: Colors.white,
    //   //           backgroundImage: NetworkImage("${sp.imageUrl}"),
    //   //           radius: 50,
    //   //         ),
    //   //       ),
    // );
  }
}
