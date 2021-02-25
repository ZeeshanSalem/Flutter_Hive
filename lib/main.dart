import 'package:flutter/material.dart';
import 'package:flutter_hive/contact_page.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: Hive.openBox("contacts"),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError)
              return Text(snapshot.error.toString());
            else
              return ContactPage();
          } else{
            return Scaffold();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Hive.box("contacts").close();
    super.dispose();
  }
}

