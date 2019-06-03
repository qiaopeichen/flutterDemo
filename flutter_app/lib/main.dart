import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

BuildContext mContext = null;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // 注册路由表
      routes: {
        "new_page": (context) => EchoRoute(),
        "new_page2": (context) => NewPage(),
        "new_page3": (context) => FocusTestRoute(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CounterWidget(),
//            ParentWidget(),
//            ParentWidgetC(),
//            FocusTestRoute(),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    mContext = context;

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("布局类Widgets"),
              textColor: Colors.blue,
              onPressed: () {
//                Navigator.of(context).pushNamed("new_page", arguments: "hi");
//                Navigator.pushNamed(context, "new_page");
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new LayoutRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("容器类Widgets"),
              textColor: Colors.blue,
              onPressed: () {
//                Navigator.of(context).pushNamed("new_page", arguments: "hi");
//                Navigator.pushNamed(context, "new_page");
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new ContainerRoute();
                }));
              },
            ),
            RandomWordsWidget(),
//            Echo(text: "hello world"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ContainerRoute extends {}

class LayoutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("布局类Widgets"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Text("open new route"),
                textColor: Colors.blue,
                onPressed: () {
//                Navigator.of(context).pushNamed("new_page", arguments: "hi");
//                Navigator.pushNamed(context, "new_page");
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new NewRoute();
                  }));
                },
              ),
              FlatButton(
                child: Text("open new Page"),
                textColor: Colors.red,
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new NewPage();
                  }));
                },
              ),
              FlatButton(
                child: Text("open new Text Page"),
                textColor: Colors.green,
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new FocusTestRoute();
                  }));
                },
              ),
              FlatButton(
                child: Text("open Tapbox "),
                textColor: Colors.deepPurple,
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new TapBoxRoute();
                  }));
                },
              ),
              FlatButton(
                child: Text("流式布局Flow "),
                textColor: Colors.pink,
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new FlowRoute();
                  }));
                },
              ),
              FlatButton(
                child: Text("流式布局Wrap "),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new WrapRoute();
                  }));
                },
              ),
              FlatButton(
                child: Text("层叠布局Stack/Positioned "),
                textColor: Colors.black,
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new StackRoute();
                  }));
                },
              ),
            ],
          ),
        ));
  }
}

class StackRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局Stack/position"),
      ),
      // 通过ConstrainedBox来确保Stack占满屏幕
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center, //指定未定位部分或定位widget的对齐方式
          children: <Widget>[
            Positioned(left: 18.0, child: Text("I am Jack")),
            Container(
              child: Text("hello world", style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(top: 18.0, child: Text("Your friend")),
          ],
        ),
      ),
    );
  }
}

class WrapRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("流式布局Wrap"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Wrap(
                spacing: 8.0, // 主轴方向间距
                runSpacing: 4.0, // 纵轴方向间距
                alignment: WrapAlignment.center,
                children: <Widget>[
                  new Chip(
                    avatar: new CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('A'),
                    ),
                    label: new Text('Hamilton'),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('M')),
                    label: new Text('Lafayette'),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('H')),
                    label: new Text('Mulligan'),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('J')),
                    label: new Text('Laurens'),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class FlowRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局Flow"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Flow(
              delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
              children: <Widget>[
                new Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                new Container(
                  width: 80,
                  height: 80,
                  color: Colors.green,
                ),
                new Container(
                  width: 80,
                  height: 80,
                  color: Colors.blue,
                ),
                new Container(
                  width: 80,
                  height: 80,
                  color: Colors.yellow,
                ),
                new Container(
                  width: 80,
                  height: 80,
                  color: Colors.brown,
                ),
                new Container(
                  width: 80,
                  height: 80,
                  color: Colors.purple,
                ),
                new Container(
                  width: 80,
                  height: 80,
                  color: Colors.pink,
                ),
                new Container(
                  width: 80,
                  height: 80,
                  color: Colors.black,
                ),
                new Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey,
                ),
                new Container(
                  width: 80,
                  height: 80,
                  color: Colors.lightGreenAccent,
                ),
                new Container(
                  width: 80,
                  height: 80,
                  color: Colors.cyan,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  getSize(BoxConstraints constraints) {
    // 指定Flow的大小
    return Size(
        double.infinity,
        MediaQuery.of(mContext).size.height -
            MediaQuery.of(mContext).padding.top -
            MediaQuery.of(mContext).padding.bottom -
            kToolbarHeight);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Demo"),
      ),
      child: Center(
        child: CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: Text("Press"),
            onPressed: () {}),
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("EchoRoute"),
      ),
      body: Center(
        child: Text(args),
      ),
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}

class Echo extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor: Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue: 0});

  final int initValue;

  @override
  _CounterWidgetState createState() {
    // TODO: implement createState
    return new _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    // 初始化状态
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return FlatButton(
      child: Text('$_counter'),
      // 点击后计数器自增
      onPressed: () => setState(() => ++_counter),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("reassemble");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() {
    // TODO: implement createState
    return new _TapboxAState();
  }
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() {
    // TODO: implement createState
    return new _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
        onTap: _handleTap,
        child: new Container(
          child: new Center(
            child: new Text(
              active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          width: 200,
          height: 200,
          decoration: new BoxDecoration(
            color: active ? Colors.yellow[900] : Colors.grey[600],
          ),
        ));
  }
}

class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() {
    // TODO: implement createState
    return new _ParentWidgetCState();
  }
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  @override
  _TapboxCState createState() {
    // TODO: implement createState
    return new _TapboxCState();
  }

  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(
            widget.active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.blue[300] : Colors.grey[600],
          border: _highlight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() {
    // TODO: implement createState
    return new _SwitchAndCheckBoxTestRouteState();
  }
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true; // 维护单选开关状态
  bool _checkboxSelected = true; // 维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected, // 当前状态
          onChanged: (value) {
            // 重新构建页面
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red, // 选中时的颜色
          onChanged: (value) {
            setState(() {
              _checkboxSelected = value;
            });
          },
        )
      ],
    );
  }
}

class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() {
    return new _FocusTestRouteState();
  }
}

class TapBoxRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TapBoxRoute"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            new TapboxA(),
            new ParentWidget(),
            new ParentWidgetC(),
          ],
        ),
      ),
    );
  }
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FocusTestRoute"),
        ),
        body: Center(
            child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: focusNode1, // 关联focusNode1
                decoration: InputDecoration(labelText: "input1"),
              ),
              TextField(
                focusNode: focusNode2, // 关联focusNode1
                decoration: InputDecoration(labelText: "input2"),
              ),
              Builder(
                builder: (ctx) {
                  return Column(
                    children: <Widget>[
                      RaisedButton(
                        child: Text("移动焦点"),
                        onPressed: () {
                          // 将焦点从第一个TextField移到第二个TextField
                          if (null == focusScopeNode) {
                            focusScopeNode = FocusScope.of(context);
                          }
                          focusScopeNode.requestFocus(focusNode2);
                        },
                      ),
                      RaisedButton(
                        child: Text("隐藏键盘"),
                        onPressed: () {
                          // 当所有编辑框都失去焦点时键盘就会收起
                          focusNode1.unfocus();
                          focusNode2.unfocus();
                        },
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        )));

//    return Column(
//      // 测试Row对齐方式，排除Column默认居中对齐的干扰
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(" hello world "),
//            Text(" I am Jack "),
//          ],
//        ),
//        Row(
//          mainAxisSize: MainAxisSize.min,
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(" hello world "),
//            Text(" I am Jack "),
//          ],
//        ),
//        Row(
//          mainAxisAlignment: MainAxisAlignment.end,
//          textDirection: TextDirection.rtl,
//          children: <Widget>[
//            Text(" hello world "),
//            Text(" I am Jack "),
//          ],
//        ),
//        Row(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          verticalDirection: VerticalDirection.up,
//          children: <Widget>[
//            Text(
//              " hello world ",
//              style: TextStyle(fontSize: 30.0),
//            ),
//            Text(" I am Jack "),
//          ],
//        )
//      ],
//    );

//    return Container(
//      color: Colors.green,
//      child: Padding(
//        padding: const EdgeInsets.all(16.0),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
//          children: <Widget>[
//            Container(
//              color: Colors.red,
//              child: Column(
//                mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
//                children: <Widget>[
//                  Text("hello world "),
//                  Text("I am Jack "),
//                ],
//              ),
//            )
//          ],
//        ),
//      ),
//    );

//    return Expanded(
//      child: Container(
//        color: Colors.red,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
//          children: <Widget>[
//            Text("hello world "),
//            Text("I am Jack "),
//          ],
//        ),
//      ),
//    );

//  return new FlexLayoutTestRoute();
  }
}

class FlexLayoutTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Flex的两个子widget按1：2来占据水平空间
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 30.0,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 30.0,
                color: Colors.green,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: 100.0,
            // Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.red,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
