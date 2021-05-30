import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermachinetest/Api/Apicalls.dart';
import 'package:fluttermachinetest/Helper/CheckConnection.dart';
import 'package:fluttermachinetest/Models/InstaModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:readmore/readmore.dart';

//scrollable Image--main

class InstagramScreen extends StatefulWidget {
  Instagram createState() => Instagram();
}

class Instagram extends State<InstagramScreen> {
  List<InstaModel> instaModel = [];

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
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height:
                                    MediaQuery.of(context).size.height * .50,
                                autoPlayCurve: Curves.fastOutSlowIn,
                              ),
                              items: [
                                instaModel[index].highThumbnail,
                                instaModel[index].highThumbnail,
                                instaModel[index].highThumbnail
                              ].map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          elevation: 0,
                                          child: Container(
                                              width: double.infinity,
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Image.network(
                                                      i,
                                                    ),
                                                  ])),
                                        ));
                                  },
                                );
                              }).toList(),
                            )),
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
                                Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.save_alt_sharp,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      onPressed: () {},
                                    ))
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
                                left: 5, right: 5, top: 5),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: ReadMoreText(
                                  instaModel[index].title,
                                  trimLines: 2,
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
                    }))));
  }

  @override
  void initState() {
    super.initState();
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
