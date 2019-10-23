import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  createState()
  {
    return _MyHomePage();
  }

}


class _MyHomePage extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        routes: {
          '/widget':(_)=>new WebviewScaffold(
            url: "https://www.indiatoday.in/information/story/list-of-emergency-numbers-in-india-1464566-2019-02-26",
            withLocalStorage: true,
            withZoom: true,
          ),
        }
      
    );
  }
  
}