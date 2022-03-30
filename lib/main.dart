import 'package:fblogs/src/artiles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'edit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '我的记事本',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: '文章列表'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: articles.map(_BuildItem).toList(),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          //打开页面新增文章
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new SecondePage(
                    title: '新增文章 ',
                  )
              )
          ).then((value) => {
            //回调刷新，用户添加完毕，这里触发刷新操作
            if(value == "refresh"){
              setState(() {
                articles.map(_BuildItem).toList();
              })
            }
          });
        },
      ),
    );
  }

  Widget _BuildItem(Article article){
    return ExpansionTile(
      initiallyExpanded:true,
      title:Text(article.text),
      children: <Widget>[
        Padding(
          padding:EdgeInsets.all(20.0),
          child: Text("简介：${article.description}"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("by ${article.by}"),
            IconButton(
              icon: Icon(Icons.link),
              color: Colors.green,
              iconSize: 16,
              onPressed: () async{
                if(await canLaunch(article.domain)){
                  launch(article.domain);
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.green,
              iconSize: 16,
              onPressed: () async{
                //移除元素
                articles.removeWhere((element) => article.text == element.text);
                //刷新页面
                setState(() {
                  articles.map(_BuildItem).toList();
                });
              },
            )
          ],
        )
      ],
    );
  }
}
