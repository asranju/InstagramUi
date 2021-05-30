import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermachinetest/Api/Apicalls.dart';
import 'package:fluttermachinetest/Models/InstaModel.dart';

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
                                                'https://googleflutter.com/sample_image.jpg'),
                                            fit: BoxFit.fill),
                                      ))),
                              Expanded(
                                  flex: 4,
                                  child: Container(
                                      child:
                                          Text(instaModel[index].channelname))),
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
                            child: Image.network(
                                'https://googleflutter.com/sample_image.jpg')),
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
                                                'https://googleflutter.com/sample_image.jpg'),
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
                                child: Text(instaModel[index].title)))
                      ]);
                    }))));
  }

  @override
  void initState() {
    super.initState();

    getData();
  }
}
