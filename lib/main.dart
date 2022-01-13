import 'package:flutter/material.dart';
import 'package:app_berita/splashscreen_view.dart';
import 'package:app_berita/components/customListTile.dart';
import 'package:app_berita/models/article_model.dart';
import 'package:app_berita/services/api_service.dart';
import 'package:app_berita/navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenPage(),
      routes: <String, WidgetBuilder>{
        'halaman': (BuildContext context) => new halaman(),
        'health': (BuildContext context) => new HomePage1(),
        'sport': (BuildContext context) => new HomePage2(),
        'profil': (BuildContext context) => new HomePage3(),
      },
    );
  }
}

class HomePage1 extends StatefulWidget {
  @override
  berita_oto createState() => berita_oto();
}

class HomePage2 extends StatefulWidget {
  @override
  berita_sp createState() => berita_sp();
}

class HomePage3 extends StatefulWidget {
  @override
  profil createState() => profil();
}

class berita_oto extends State<HomePage1> {
  ApiService_oto client = ApiService_oto();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Health News", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class berita_sp extends State<HomePage2> {
  ApiService_sp client = ApiService_sp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Sport News", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class profil extends State<HomePage3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Profile"),
            backgroundColor: Colors.white,
          ),
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/lin.jpg'),
              ),
              Text(
                'Linda oktaviyani',
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.account_circle, color: Colors.black),
                  title: Text(
                    '19710080',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.school_rounded, color: Colors.black),
                  title: Text(
                    '5A SI BJM',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(
                    left: 25.0, top: 25.0, right: 25.0, bottom: 25.0),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.black),
                  title: Text(
                    '+62 876 9087 8723',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.home, color: Colors.black),
                  title: Text(
                    'Jl. Batu Benawa No.26',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
              ),
            ],
          ))),
    );
  }
}
