import 'package:flutter/material.dart';
import 'package:studi_kasus/flask_api.dart';
import 'package:studi_kasus/screens/login.dart';
import '../widgets/card.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title = 'K-means Algorithme'});

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
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('You are logged out')));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ],
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
