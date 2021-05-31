import 'package:flutter/material.dart';
import 'package:fluttermachinetest/Models/InstaModel.dart';
import 'package:readmore/readmore.dart';

import 'Helper/DatabaseHelper.dart';

class BookMarkedItems extends StatefulWidget {
  BookMarked createState() => BookMarked();
}

class BookMarked extends State<BookMarkedItems> {
  List<InstaModel> instaModel = [];
  late DatabaseHandler handler;

  delete(String userId, int index) {
    setState(() {
      instaModel = List.from(instaModel)..removeAt(index);
    });
    handler.deleteUser(userId);
  }

  getData() {
    InstaModel data;
    handler.retrieveUsers().then((value) => {
          for (int j = 0; j < value.length; j++)
            {
              data = InstaModel(
                  value[j].userId,
                  value[j].channelname,
                  value[j].titile,
                  value[j].hthumbnail,
                  value[j].mthumbnail,
                  value[j].lthumbnail,
                  [],
                  true),
              setState(() {
                instaModel.add(data);
              }),
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Column(children: [
          Container(
              height: MediaQuery.of(context).size.height * .06,
              margin: const EdgeInsets.only(
                top: 30,
              ),
              width: MediaQuery.of(context).size.width * 1,
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Book Mark ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ])),
          Container(
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
                                          image: NetworkImage(instaModel[index]
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
                          margin:
                              const EdgeInsets.only(left: 5, right: 5, top: 0),
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
                                          delete(instaModel[index].id, index);
                                          // addData(instaModel[index]);
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
                                        },
                                      )),
                            ],
                          )),
                      Container(
                          margin:
                              const EdgeInsets.only(left: 5, right: 5, top: 5),
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
                          margin:
                              const EdgeInsets.only(left: 5, right: 5, top: 5),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: ReadMoreText(
                                instaModel[index].title +
                                    " for added  CHECK MORE in ui ",
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
                              )))
                    ]);
                  }))
        ])));
  }

  @override
  void initState() {
    super.initState();
    this.handler = DatabaseHandler();
    this.handler.initializeDB().whenComplete(() async {});

    getData();
  }
}
