import 'package:flutter/material.dart';
import 'settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
//import 'dd.dart';
import 'qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ADrawer extends StatefulWidget {
  final User user;
  const ADrawer({Key key, this.user}) : super(key: key);
  State createState() => new ADrawerState();
}

class ADrawerState extends State<ADrawer> {
  QrImage qr;

  FirebaseAuth _auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: getProfilename(),
              accountEmail: getProfileemail(),
              currentAccountPicture: getProfileImage()),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            hoverColor: Colors.red,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          new Divider(
            color: Colors.black,
            height: 5,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            hoverColor: Colors.red,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Set()));
            },
          ),
          new Divider(
            color: Colors.black,
            height: 5,
          ),
          ListTile(
            leading: Icon(Icons.supervisor_account),
            title: Text('About us'),
            hoverColor: Colors.red,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          new Divider(
            color: Colors.black,
            height: 5,
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            hoverColor: Colors.red,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          new Divider(
            color: Colors.black,
            height: 5,
          ),
          ListTile(
              leading: Icon(Icons.qr_code),
              title: Text('QrCode'),
              hoverColor: Colors.red,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CodeQR()));
              }),
          new Divider(
            color: Colors.black,
            height: 5,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            hoverColor: Colors.red,
            onTap: () {
              _signOut(_auth.currentUser);
            },
          )
        ],
      ),
    );
  }

  getProfileImage() {
    if (_auth.currentUser.photoURL != null) {
      return Image.network(_auth.currentUser.photoURL, height: 100, width: 100);
    } else {
      return Icon(Icons.account_circle, size: 100);
    }
  }

  getProfileemail() {
    if (_auth.currentUser.email != null) {
      return Text(_auth.currentUser.email);
    } else {
      return Text("User@user.com");
    }
  }

  getProfilename() {
    if (_auth.currentUser.displayName != null) {
      return Text(_auth.currentUser.displayName);
    } else {
      return Text("Name");
    }
  }

  Future<void> _signOut(User user) async {
    user = _auth.signOut() as User;
    print("loggedOut");
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
  /*void _signOut() {
    FirebaseAuth.instance.signOut();
    User user = FirebaseAuth.instance.currentUser;
    //print('$user');
    runApp(new MaterialApp(
      home: new LoginPage(),
    ));
  }*/
}
