import 'package:flutter/material.dart';
import 'home.dart';
import 'call.dart';
import 'sms.dart';
void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  //Navigator navigator;
  createState()
  {
    return _MyHomePage();
  }

}


class _MyHomePage extends State<MyApp> {

  int _selectedIndex=1;
  List<Widget> _widgetOptions=<Widget>[
    //Text('HOME PAGE HERE',style: TextStyle(fontSize: 36.0),),
    Text('WORK PAGE HERE',style: TextStyle(fontSize: 36.0),),
    HomePage(),
    Text('SETTINGS',style: TextStyle(fontSize: 36.0),),
     /*
    HomePage(),
    WorkPage(),
    SettingsPage(),
    */
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: '/',
      /*routes: {
        //'/':(context)=> MaterialApp(),
        '/second':(context)=>CallPage(),
      },*/
      title: 'OneTapLifeline',
      home: Builder(
        builder: (context)=>Scaffold(
        appBar: AppBar(title: Text('LifeLine'),),
        body:_widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              title: Text('Map')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Me')
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.pink[600],
          onTap: _onItemTapped,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('One Tap Lifeline',style: TextStyle(fontSize: 25,color: Colors.white),),
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                ),
              ),
              ListTile(
                title: Text('Guide'),
                  leading: IconButton(
                    icon: Icon(Icons.receipt,color: Colors.pink[600]),
                  ),
                onTap: () {}
              ),
              ListTile(
                title: Text('Call'),
                leading: IconButton(
                  icon: Icon(Icons.call,color: Colors.pink[600]),
                ),

                onTap: (){
                 // Navigator.pushNamed(context, "/second");
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>new CallPage()),
                  );
                }

              ),
              ListTile(
                title: Text('Sms'),
                  leading: IconButton(
                    icon: Icon(Icons.sms,color: Colors.pink[600]),
                  ),
                onTap: (){
                  // Navigator.pushNamed(context, "/second");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>new SmsPage()),
                  );
                }
              ),
              ListTile(
                title: Text('Track Location'),
                leading: IconButton(
                  icon: Icon(Icons.location_on,color: Colors.pink[600]),
                ),
                onTap: (){

                },
              ),
              ListTile(
                title: Text('About'),
                leading: IconButton(
                  icon: Icon(Icons.help,color: Colors.pink[600]),
                ),
                onTap: (){
                  //Navigator.pop(context);
                },
              ),

            ],
          ),
        ),
      ),
      ),
    );
  }

}

