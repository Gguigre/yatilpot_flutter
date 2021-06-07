import 'package:flutter/material.dart';
import 'package:yatilpot_flutter/app/pages/instructions/instructions.view.dart';
import 'package:yatilpot_flutter/app/pages/pot/pot.view.dart';
import 'package:yatilpot_flutter/app/pages/rules/rules.view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.local_drink)),
                Tab(icon: Icon(Icons.integration_instructions)),
                Tab(icon: Icon(Icons.rule)),
              ],
            ),
            title: Text('Yatilpot'),
          ),
          body: TabBarView(
            children: [
              PotPage(),
              Instructions(),
              Rules(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(),
    );
  }
}
