import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  DateTime selected;
  _showDateTimePicker() async {
    selected = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1960),
      lastDate: new DateTime(2050),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title : Text("Dashboard"),
        backgroundColor: Colors.blueGrey,

        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () { Scaffold.of(context).openDrawer(); },
            );
          },
        ),

        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications_active), onPressed: () {
            showAlertDialog(context);
            },
          ),
        ],

      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItemBook("Book", Icons.book),
            makeDashboardItemTransport("Transport", Icons.directions_bus),
            makeDashboardItemLibrary("Library", Icons.local_library),
            makeDashboardItemComment("Comment", Icons.insert_comment),
            makeDashboardItemNotes("Notes", Icons.event_note),
            makeDashboardItemSettings("Settings", Icons.settings),
            makeDashboardItemApps("Apps", Icons.apps),
            makeDashboardItemNotifications("Notifications", Icons.notifications_none)
          ],
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.fromLTRB(25, 110, 0, 0),
              child: Text("Your Full Name\nxyz@example.com", style: new TextStyle(fontSize: 18.0, color: Colors.white)),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            ListTile(
              leading:Icon(Icons.person,color: Colors.blueGrey),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileRoute()),
                );
              },
            ),
            ListTile(
              leading:Icon(Icons.calendar_today,color: Colors.blueGrey),
              title: Text('Calendar'),
              onTap: ()   => _showDateTimePicker(),
              /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarRoute()),
                );*/
            ),
            ListTile(
              leading:Icon(Icons.power_settings_new,color: Colors.blueGrey),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogoutRoute()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text("Dismiss"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget okButton = FlatButton(
      child: Text("Ok"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Notifications"),
      content: Text("Your Notifications Will Apperar Here! \n\nYou Can Dismiss And Click Ok Flat Button."),
      actions: [
        cancelButton,
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

/*  Card makeDashboardItem(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.blueGrey,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title, style: new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }*/
  Card makeDashboardItemBook(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookRoute()),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.blueGrey,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title, style: new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  Card makeDashboardItemNotifications(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsRoute()),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.blueGrey,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title, style: new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  Card makeDashboardItemTransport(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransportRoute()),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.blueGrey,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title, style: new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  Card makeDashboardItemLibrary(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>LibraryRoute()),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.blueGrey,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title, style: new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  Card makeDashboardItemNotes(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotesRoute()),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.blueGrey,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title, style: new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  Card makeDashboardItemApps(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppsRoute()),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.blueGrey,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title, style: new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  Card makeDashboardItemSettings(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsRoute()),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.blueGrey,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title, style: new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }

  Card makeDashboardItemComment(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommentRoute()),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.blueGrey,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title, style: new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
}

class ProfileRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String imgUrl = '';
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
        backgroundColor: Colors.white,
        body: new Center(
          child: new Column(
            children: <Widget>[
              new SizedBox(height: 25,),
              new CircleAvatar(radius:75<75? 75:75,backgroundImage: NetworkImage(imgUrl),),
              new SizedBox(height: 25,),
              new Text('Your Full Name\nxyz@example.com', style: new TextStyle(fontWeight: FontWeight.bold, fontSize:25, color: Colors.black),
                textAlign: TextAlign.center,),
              new Text('', style: new TextStyle( fontSize: 15, color: Colors.black),
                textAlign: TextAlign.left,),
              new Text('Enrollment No.', style: new TextStyle( fontSize: 15, color: Colors.black),
                textAlign: TextAlign.left,),
              new Divider(height:55,thickness: 3,color: Colors.black),
              new Text('Grade', style: new TextStyle( fontSize: 15, color: Colors.black),
                textAlign: TextAlign.center,),
              new Text('Section', style: new TextStyle( fontSize: 15, color: Colors.black),
                textAlign: TextAlign.center,),
              new Text('Group', style: new TextStyle( fontSize: 15, color: Colors.black),
                textAlign: TextAlign.center,),
              new Text('Attendance', style: new TextStyle( fontSize: 15, color: Colors.black),
                textAlign: TextAlign.center,),
            ],
          ),
        )
    );
  }
}

class BookRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books"),
      ),
      body: Center(
        child: Text('Books Here !',
            style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),textAlign: TextAlign.center,),
      ),
    );
  }
}

class AppsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apps"),
      ),
      body: Center(
        child: Text('Apps Here !',
            style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),textAlign: TextAlign.center),
      ),
    );
  }
}

class NotificationsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Center(
        child: Text('Notifications Here !',
            style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),textAlign: TextAlign.center,),
      ),
    );
  }
}

class LibraryRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Library"),
      ),
      body: Center(
        child: Text('Library Here !',
            style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),textAlign: TextAlign.center),
      ),
    );
  }
}

class TransportRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transport"),
      ),
      body: Center(
        child: Text('Transport Here !',
            style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),textAlign: TextAlign.center),
      ),
    );
  }
}

class SettingsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: Text('Settings Here !',
            style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),textAlign: TextAlign.center),
      ),
    );
  }
}

class NotesRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: Center(
        child: Text('Notes Here !',
            style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),textAlign: TextAlign.center),
      ),
    );
  }
}

class CommentRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment"),
      ),
      body: Center(
        child: Text('Comment Here !',
            style: TextStyle(
                fontSize: 30.0,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),textAlign: TextAlign.center),
      ),
    );
  }
}

class LogoutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logout"),
      ),
      body: Center(
        //child: Text('Logout Successfully !!!'),
          child: Text('Logout Successful !!!',
              style: TextStyle(
                  fontSize: 30.0,
                  letterSpacing: 5,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),textAlign: TextAlign.center),
      ),
    );
  }
}