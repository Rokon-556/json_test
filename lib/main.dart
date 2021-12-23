import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List ? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Load Json'),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('json_get/appointment.json'),
            builder: (context, snapshot) {
              var myData = json.decode(snapshot.data.toString());
              return ListView.builder(itemBuilder: (BuildContext context,int index){
                return Card(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:
                  <Widget> [
                   Text("ID:"+myData[index]['id'].toString()),
                   Text("Name:"+myData[index]['name']),
                   Text("Latitude:"+myData[index]['latitude'].toString()),
                   Text("Longitude:"+myData[index]['longitude'].toString()),
                  ],
                ),);
              },itemCount: myData==null?0:myData.length,);
            },
          ),
        ),
      ),
    );
  }
}
