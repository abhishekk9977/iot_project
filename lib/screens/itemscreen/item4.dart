import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Models/dataModel.dart';
import '../../utils/drawerWidget.dart';
import '../../utils/next_screen.dart';
import '../controller_screen.dart/iot_wifi_controller.dart';
import '../controller_screen.dart/jsonDataController.dart';

class Item4 extends StatelessWidget {
  const Item4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 152, 150, 143),
        centerTitle: true,
        title: Text(
          "Item 4",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(children: [
            Flexible(
              child: FutureBuilder(
                future: readJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    print("ndcn");
                    return SnackBar(content: Text("${data.error}"));
                  } else if (data.hasData) {
                    List<DataModel> items = data.data!
                        .where((element) => element.roboNum!.isOdd)
                        .toList();

                    return GridView.builder(
                      itemCount: items == null ? 0 : items.length,
                      itemBuilder: (context, index) {
                        //SliverGridDelegateWithMaxCrossAxisExtent();
                        // if (items[index].roboNum! % 2 == 0) {}
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
  }
}
