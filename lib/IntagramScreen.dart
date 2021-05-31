import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermachinetest/Api/Apicalls.dart';
import 'package:fluttermachinetest/Helper/CheckConnection.dart';
import 'package:fluttermachinetest/Helper/DatabaseHelper.dart';
import 'package:fluttermachinetest/Models/InstaModel.dart';
import 'package:fluttermachinetest/Models/TableModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:readmore/readmore.dart';

//scrollable Image--main

class InstagramScreen extends StatefulWidget {
  Instagram createState() => Instagram();
}

class Instagram extends State<InstagramScreen> {
  late DatabaseHandler handler;
  List<InstaModel> instaModel = [];

  delete(String userId) {
    handler.deleteUser(userId);
  }

  addData(InstaModel addList) {
    TableModel data = TableModel(addList.id, addList.channelname, addList.title,
        addList.highThumbnail, addList.mediumThumbnail, addList.lowThumbnail);
    List<TableModel> listOfUsers = [data];
    handler.insertUser(listOfUsers);
  }

  getData() {
    Apicalls.getUserdata().then((value) => {
          for (int k = 0; k < value!.length; k++)
            {
              instaModel.add(value[k]),
            },
          setState(() {
            instaModel:
            instaModel;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
                height: MediaQuery.of(context).size.height * .85,
                margin: const EdgeInsets.only(left: 5, right: 5),
                child: ListView.builder(
                    itemCount: instaModel.length == 0 ? 0 : instaModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        Container(
                            height: 60,
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                instaModel[index]
                                                    .mediumThumbnail),
                                            fit: BoxFit.fill),
                                      ))),
                              Expanded(
                                  flex: 4,
                                  child: Container(
                                      child: Text(instaModel[index].channelname,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      child: IconButton(
                                    icon: Icon(
                                      Icons.more_vert,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                    onPressed: () {},
                                  ))),
                            ])),
                        Container(
                            height: MediaQuery.of(context).size.height * .50,
                            child:
                                Image.network(instaModel[index].highThumbnail)),
                        Container(
                            margin: const EdgeInsets.only(
                                left: 5, right: 5, top: 0),
                            height: 40,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        getData();
                                      },
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.mode_comment_outlined,
                                        size: 30,
                                      ),
                                      onPressed: () {},
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.near_me_outlined,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      onPressed: () {},
                                    )),
                                Expanded(flex: 3, child: Container()),
                                instaModel[index].bmark
                                    ? Expanded(
                                        flex: 1,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.bookmark,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              instaModel[index].bmark = false;
                                            });
                                            delete(instaModel[index].id);
                                          },
                                        ))
                                    : Expanded(
                                        flex: 1,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.bookmark_border,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              instaModel[index].bmark = true;
                                            });
                                            addData(instaModel[index]);
                                          },
                                        )),
                              ],
                            )),
                        Container(
                            margin: const EdgeInsets.only(
                                left: 5, right: 5, top: 5),
                            child: Row(children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                instaModel[index].lowThumbnail),
                                            fit: BoxFit.fill),
                                      ))),
                              Expanded(
                                flex: 2,
                                child: Container(
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text("Liked by"))),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                    child: Text("ranjith_as",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(child: Text("and")),
                              ),
                              Expanded(
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: Text("60000 others",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                ),
                              )
                            ])),
                        Container(
                            margin: const EdgeInsets.only(
                                left: 40, right: 5, top: 5),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: ReadMoreText(
                                  instaModel[index].title,
                                  style: TextStyle(color: Colors.black),
                                  trimLength: 30,
                                  trimLines: 1,
                                  colorClickableText: Colors.black,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: 'More',
                                  trimExpandedText: 'less',
                                  moreStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                  lessStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                )))
                      ]);
                    }))));
  }

  @override
  void initState() {
    super.initState();

    this.handler = DatabaseHandler();
    this.handler.initializeDB().whenComplete(() async {});

    NetWorkCheck.checknetWorkStatus().then((connectivityStatus) => {
          if (connectivityStatus)
            {
              getData(),
            }
          else
            {
              Fluttertoast.showToast(
                  msg: "Check Network connection",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0),
            }
        });
  }
}
