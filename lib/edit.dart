/*
这是第二个页面，包含一个返回的按钮
 */
import 'package:fblogs/src/artiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondePage extends StatelessWidget {
  const SecondePage({Key? key, this.title}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {

    final _textController = TextEditingController();
    final _descController = TextEditingController();
    final _domainController = TextEditingController();
    final _byController = TextEditingController();

    return Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: Form(
        child: Column(
          //显式指定对齐方式为左对齐，排除对齐干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _textController,
              // 打开该页面时，焦点落脚处
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                // 标签图标
                  prefixIcon: Icon(Icons.title),
                  // 标签文字
                  labelText: '文章标题',
                  // 提示文字
                  hintText: '请输入文章标题'
              ),
              validator: (context){
                if(context!.length <= 0){
                  return '文章标题太短';
                }
                if(context.length > 8){
                  return '文章标题太长';
                }
              },
            ),
            TextFormField(
              controller: _descController,
              // 回车键变成完成
              textInputAction: TextInputAction.done,
              maxLines: 3,
              decoration: InputDecoration(
                // 标签图标
                prefixIcon: Icon(Icons.description),
                // 标签上的文本
                labelText: '文章描述',
                hintText: '请输入文章描述',
              ),
              validator: (context){
                if(context!.isEmpty){
                  return '文章描述不能为空';
                }
              },
            ),
            TextFormField(
              controller: _domainController,
              // 回车键变成完成
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  // 标签图标
                  prefixIcon: Icon(Icons.link),
                  // 标签上的文本
                  labelText: '文章链接',
                  hintText: '请输入文章链接',
                ),
                validator: (context){
                  if(context!.isEmpty){
                    return '文章链接不能为空';
                  }
                },
            ),
            TextFormField(
              controller: _byController,
              // 回车键变成完成
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  // 标签图标
                  prefixIcon: Icon(Icons.person),
                  // 标签上的文本
                  labelText: '文章作者',
                  hintText: '请输入文章作者',
                ),
                validator: (context){
                  if(context!.isEmpty){
                    return '文章作者不能为空';
                  }
                },
            ),
            Row(
              children: [
                // 登录按钮
                Padding(
                  // 用于设置对称方向的填充,vertical指top和bottom，horizontal指left和right
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  child : ElevatedButton(
                    style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15)),
                    child: Text('保存'),
                    // 按钮点击事件
                    onPressed: () {
                      print(_textController.text);
                      print(_descController.text);
                      print(_domainController.text);
                      print(_byController.text);
                      Article article = new Article(text: _textController.text
                          , description: _descController.text
                          , domain: _domainController.text
                          , by: _byController.text);
                      articles.add(article);
                      //返回首页,触发刷新
                      Navigator.of(context).pop("refresh");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}