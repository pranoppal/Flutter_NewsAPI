import 'dart:convert';
import 'package:newsapi/API.dart';
import 'package:newsapi/Article.dart';
//import 'package:apiJsonListview/API.dart';
//import 'package:apiJsonListview/models/User.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var articles = new List<Article>();

  _getArticles() {
    API.getArticles().then((response) {
      setState(() {
        var data = json.decode(response.body);
        var rest = data["articles"] as List;
        articles = rest.map((model) => Article.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getArticles();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News title"),
        ),
        body: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(articles[index].title));
          },
        ));
  }
}