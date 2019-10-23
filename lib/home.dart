import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:lamp/lamp.dart';
import 'package:permission/permission.dart';

class HomePage extends StatefulWidget {
  createState()
  {
    return _Home1();
  }

}


class _Home1 extends State<HomePage> {
  requestCameraPermission() async {
    final res = await Permission.requestPermissions([PermissionName.Camera,]);
    res.forEach((permission) {
      String a = '${permission.permissionStatus}';
      setState(() {
        if (a == 'PermissionStatus.allow') {
          Lamp.turnOn();
        }
        else {
          Permission.openSettings;
        }
      });
    });
  }

  int i=0;
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
      },
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context)=>Scaffold(
        body:
        GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),),
              elevation: 8.0,
              child: Text('Emergency numbers',style: TextStyle(fontSize: 20,color: Colors.black),),
              color:Colors.blue[100],
              onPressed: (){
                print('asds');
                Navigator.pushNamed(context, "/widget");

              },
            ),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),),
              elevation: 8.0,
              child: Text('Fire',style: TextStyle(fontSize: 20,color: Colors.black),),
              color:Colors.blue[200],
              onPressed: (){},
            ),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),),
              elevation: 8.0,
              child: Text('Disaster',style: TextStyle(fontSize: 20,color: Colors.black),),
              color:Colors.blue[300],
              onPressed: (){},
            ),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),),
              elevation: 8.0,
              child: Text('Flash alert',style: TextStyle(fontSize: 20,color: Colors.black),),
              color:Colors.blue[400],
              onPressed:()async
                {
                  var get = '';
                  List permissions = await Permission.getPermissionsStatus(
                      [PermissionName.Camera,]);
                  permissions.forEach((permission) {
                    get += '${permission.permissionName}: ${permission.permissionStatus}';
                    if (get != "PermissionName.Camera: PermissionStatus.allow") {
                      requestCameraPermission();
                    } else {
                      Lamp.turnOn();
                    }
                  });
                }
              //async=>await Lamp.flash(new Duration(seconds: 2)),
              /*{
                Lamp.flash(new Duration(seconds: 2));
                if(i==0) {
                  Lamp.turnOn();
                  i=1;
                }
                else {
                  Lamp.turnOff();
                  i=0;
                }   
              },*/
            ),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),),
              elevation: 8.0,
              child: Text('item',style: TextStyle(fontSize: 20,color: Colors.black),),
              color:Colors.blue[500],
              onPressed: (){},
            ),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),),
              elevation: 8.0,
              child: Text('item',style: TextStyle(fontSize: 20,color: Colors.black),),
              color:Colors.blue[600],
              onPressed: (){},
            ),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),),
              elevation: 8.0,
              child: Text('item',style: TextStyle(fontSize: 20,color: Colors.black),),
              color:Colors.blue[700],
              onPressed: (){},
            ),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),),
              elevation: 8.0,
              child: Text('item',style: TextStyle(fontSize: 20,color: Colors.black),),
              color:Colors.blue[800],
              onPressed: (){},
            ),


          ],
        ),
      ),
      ),
    );
  }

}