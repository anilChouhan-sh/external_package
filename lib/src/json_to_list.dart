import 'dart:convert';

import 'package:flutter/material.dart';



class Json_to_list extends StatefulWidget {
  String _key;
  Json_to_list(this._key);

  @override
  _Json_to_listState createState() => _Json_to_listState();
}

class _Json_to_listState extends State<Json_to_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("List of Marvel Movies")),
        body: SingleChildScrollView(
          child: FutureBuilder(
            builder: (context, snapshot) {
              var data = json.decode(snapshot.data.toString());

              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                          color: Colors.teal[700],
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  data[index]["title"],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                              SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  data[index]["release_date"],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                            ],
                          )),
                    );
                  },
                ),
              );
            },
            future: DefaultAssetBundle.of(context).loadString(widget._key),
          ),
        ));
  }
}