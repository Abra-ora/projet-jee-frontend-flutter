import 'package:flutter/material.dart';
import 'package:studi_kasus/flask_api.dart';
import '../widgets/card.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title = 'Demo'});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Text(widget.title),
        ),
        body: Container(
            padding: EdgeInsets.all(16.0),
            child: FutureBuilder<List<dynamic>>(
              future: flaskApi.getGraphs(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data[0]["name"]);
                  return SingleChildScrollView(
                      // scrollDirection: Axis.vertical,
                      child: Column(
                    children: [
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return buildCard(
                                snapshot.data[index]["title"],
                                snapshot.data[index]["name"],
                                snapshot.data[index]["description"]);
                          })
                    ],
                  ));
                  // return Center(child: CircularProgressIndicator());
                } else {
                  print("No graphs");
                  return Center(
                    child: buildCard("No graphs exist", "void.png",
                        "Check K-means model to draw new graphs"),
                  );
                }
              },
            )
            // child: SingleChildScrollView(
            //     scrollDirection: Axis.vertical,
            //     child: Column(
            //       children: [
            //         buildCard(),
            //         buildCard(),
            //         buildCard(),
            //         buildCard(),
            //         buildCard(),
            //         buildCard(),
            //         buildCard(),
            //       ],
            //     )),
            ));
  }
}
