import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seawise_app/PaymentScreen.dart';
import 'package:seawise_app/stripecard.dart';
import 'custom_theme.dart';
import 'BuildData.dart';

class Reservation extends StatelessWidget {
  final backgroundImage = new Container(
    decoration: new BoxDecoration(
      image: new DecorationImage(
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.luminosity),
        image: new AssetImage('assets/images/yate.jpg'),
        fit: BoxFit.cover,
      ),
    ),
  );


  final onTopContent = new Container(
    height: 80.0,
    child: new Column(mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text("Trending this week",
            style: bigHeaderTextStyle),

        new Text("The most popular restaurnts in town this week",
            style: descTextStyle),
        //new Container(),
        new Container(
          height: 2.0,
          width: 150.0,
          color: Colors.redAccent,
        ),
        new Text("30 PLACES",
            style: footerTextStyle),
        //new Container()
      ],
    ),
  );

  final textSection = new Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'THIS IS THE RESERVATION THIS IS THE RESERVATION THIS IS THE RESERVATION'
          'THIS IS THE RESERVATION THIS IS THE RESERVATION THIS IS THE RESERVATION'
          'THIS IS THE RESERVATION THIS IS THE RESERVATION THIS IS THE RESERVATION'
          'THIS IS THE RESERVATION THIS IS THE RESERVATION THIS IS THE RESERVATION'
          'THIS IS THE RESERVATION THIS IS THE RESERVATION THIS IS THE RESERVATION'
          'THIS IS THE RESERVATION THIS IS THE RESERVATION THIS IS THE RESERVATION.',
      softWrap: true,
    ),
  );

  final timeReservationSection = new Container(
      padding: const EdgeInsets.all(20),
      child: new Row(

        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[


          new Flexible(
            child: BasicTimeField2(),
          ),
        ],
      )
  );




  final reservationSection = new Container(
  padding: const EdgeInsets.all(20),
  child: new Row(

    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[

      new Flexible(
        child: BasicDateField(),

      ),
      new Flexible(
        child: BasicTimeField(),
      ),
    ],
  )
  );

  final titleSection = new Container(
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Center(
                child: Container(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text(
                  'Azimut 50\'',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF0F1E40)
                  ),
                ),
              ),
              ),
             /* Center(
                child:Text(
                  'Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
                ),
              ),*/
             /* Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'AZIMUT 50',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),*/
            ],
          ),
        ),
        /*3*/
        /*Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Text('41'),*/
      ],
    ),
  );

  final buttonReserve = new Container(
      padding: const EdgeInsets.all(32),
      child: ButtonTheme(
        height: 50.0,
      child: RaisedButton(
        elevation: 4,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(4.0)
        ),
        color: const Color(0xFF3298BF),
        onPressed: () {
          },
        child: const Text(
          'Reserve',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Segoe UI',
              )
        ),

      ),
      ),
  );


/*final imageSection = new Container(
  padding: new EdgeInsets.all(8.0),
  height: 250.0,
  child: new Stack(
  children: <Widget>[
  this.backgroundImage,
  new Container(
  padding: new EdgeInsets.all(10.0),
  child: new Align(
  alignment: Alignment.bottomLeft,
  child: this.onTopContent,
  ),
  ),
  ],
  ),
);*/



  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(8.0),
      height: 700.0,
      child: ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(8.0),
            height: 250.0,
            child: new Stack(
              children: <Widget>[
                backgroundImage,
               /* new Container(
                  padding: new EdgeInsets.all(10.0),
                  child: new Align(
                    alignment: Alignment.bottomLeft,
                    child: onTopContent,
                  ),
                ),*/
              ],
            ),
          ),
          titleSection,
          reservationSection,
          timeReservationSection,
          textSection,
          new Container(
          padding: const EdgeInsets.all(32),
          child: ButtonTheme(
          height: 50.0,
          child: RaisedButton(
          elevation: 4,
          shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(4.0)
          ),
          color: const Color(0xFF3298BF),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentScreen(),
              ),
            );
          },
          child: const Text(
          'Reserve',
          style: TextStyle(
          color: Colors.white,
    fontSize: 18,
    fontFamily: 'Segoe UI',
    )
    ),

    ),
    ),
    ),

        ],
      ),
    );

  }


}
