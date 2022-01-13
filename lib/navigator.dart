import 'package:flutter/material.dart';
import 'dart:async';
import 'package:app_berita/main.dart';

//Membuat Halaman Crad
class halaman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Heading"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              IconButton(
                icon: new Icon(Icons.local_hospital_rounded),
                onPressed: () {
                  Navigator.pushNamed(context, 'health');
                },
                iconSize: 70.0,
              ),
              Text("Sport")
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: new Icon(Icons.sports_basketball_rounded),
                onPressed: () {
                  Navigator.pushNamed(context, 'sport');
                },
                iconSize: 70.0,
              ),
              Text("Sport")
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: new Icon(Icons.person),
                onPressed: () {
                  Navigator.pushNamed(context, 'profil');
                },
                iconSize: 70.0,
              ),
              Text("Profile")
            ],
          )
        ],
      )),
    );
  }
}
