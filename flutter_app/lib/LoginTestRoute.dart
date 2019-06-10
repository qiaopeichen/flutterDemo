import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

import 'InheritedWidget.dart';

class LoginTestRoute extends StatelessWidget {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();

  @override
  Widget build(BuildContext context) {
    //定义一个状态，保存当前指针位置
    PointerEvent _event;
    return Scaffold(
//      backgroundColor: Colors.white,

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: AssetImage('assets/ic_ycy.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 30),
                child: Container(
                  width: 200,
                  child: TextField(
                    autofocus: true,
                    focusNode: focusNode1, //关联focusNode1
                    decoration: InputDecoration(labelText: "用户名"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                child: Container(
                  width: 200,
                  child: TextField(
                    autofocus: true,
                    focusNode: focusNode2, //关联focusNode1
                    decoration: InputDecoration(labelText: "密码"),
                  ),
                ),
              ),
              Padding(

                padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                child: Listener(
                  child: Container(
                    width: 200,
                    child: FlatButton(
                      child: Text("登录"),
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              Container(
                width: 200,
                child: FlatButton(
                  child: Text("注册"),
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    showCupertinoDialog(
                        context: context,
                        builder: (_) => _generateSimpleDialog(context));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _generateSimpleDialog(BuildContext context) {
    return SimpleDialog(
      title: Text('simple dialog title'),
      children: <Widget>[
        Container(
          height: 100,
          child: Text('这里填写内容'),
        ),
        FlatButton(
          child: Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('确认'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
