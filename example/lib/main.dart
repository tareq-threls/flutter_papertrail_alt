import 'package:flutter/material.dart';
import 'package:flutter_papertrail_alt/flutter_papertrail_alt.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
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
        hostName: "logs2.papertrailapp.com",
        programName: "flutter-test-app",
        port: 47001,
        machineName: "Pixel 4 example app");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
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
        appBar: AppBar(
          title: const Text('Papertrail logging example'),
          backgroundColor: Color.fromARGB(39, 212, 0, 255),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Press the + button to test logging to Papertrail'),
              TextButton(
                child: const Text('Identify User'),
                onPressed: () {
                  FlutterPaperTrailAlt.setUserId("JohnDoe");
                },
              ),
              const Text('Press the + button again after identifying the user'),
            ],
          ),
        ),
      ),
    );
  }
}
