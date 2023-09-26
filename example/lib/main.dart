import 'package:flutter/material.dart';
import 'package:flutter_papertrail_alt/flutter_papertrail_alt.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future initPlatformState() async {
    return FlutterPaperTrailAlt.initLogger(
        hostName: "logs.papertrailapp.com",
        programName: "flutter-test-app",
        port: 99999,
        machineName: "Pixel 4 example app");
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        floatingActionButton: new FloatingActionButton(
          onPressed: () async {
            await FlutterPaperTrailAlt.logError(
                "I love logging errors on paper trail");
            await FlutterPaperTrailAlt.logInfo(
                "I love logging infos on paper trail");
            await FlutterPaperTrailAlt.logWarning(
                "I love logging warnings on paper trail");
            await FlutterPaperTrailAlt.logDebug(
                "I love logging debugs on paper trail");
          },
          tooltip: 'Log to papertrail',
          child: const Icon(Icons.add),
        ),
        appBar: new AppBar(
          title: const Text('Papertrail logging example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Press the + button to test logging to Papertrail'),
              TextButton(
                child: Text('Identify User'),
                onPressed: () {
                  FlutterPaperTrailAlt.setUserId("JohnDoe");
                },
              ),
              Text('Press the + button again after identifying the user'),
            ],
          ),
        ),
      ),
    );
  }
}
