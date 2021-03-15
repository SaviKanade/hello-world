import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TC extends StatefulWidget {
  final User user;
  const TC({Key key, this.user}) : super(key: key);
  @override
  _AccDecState createState() => _AccDecState();
}

class _AccDecState extends State<TC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BOP"), backgroundColor: Colors.red),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50,
            child: MaterialButton(
              onPressed: () {},
              color: Colors.red,
              highlightColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.white),
              ),
              elevation: 8.0,
              child: Center(
                child: Text(
                  'Accept'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 50),
          Container(
            height: 50,
            child: MaterialButton(
              onPressed: () {},
              color: Colors.red,
              highlightColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.white),
              ),
              elevation: 8.0,
              child: Center(
                child: Text(
                  'Decline'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
