import 'package:flutter/material.dart';
import 'Reservation.dart';
import 'yacht_detail.dart';

class ScreenR extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(

        child: AppBar(
          backgroundColor: const Color(0xFF0F1E40),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 35),
              child: Icon(Icons.search),
            ),
          ],
        ),
        preferredSize: Size.fromHeight(80.0),),
      body: new Reservation(),
    );
  }
}