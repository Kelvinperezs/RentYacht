import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'ScreenReservation.dart';
import 'custom_theme.dart';

class YachtDetil extends StatelessWidget {
  final backgroundImage = new Container(
    decoration: new BoxDecoration(
      image: new DecorationImage(
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.6),
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

        new Text("The most popular Yacht in The world this week",
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
      'This is the Yacht\'s Detail Information '
          'This is the Yacht\'s Detail Information '
          'This is the Yacht\'s Detail Information '
          'This is the Yacht\'s Detail Information '
          'This is the Yacht\'s Detail Information '
          'This is the Yacht\'s Detail Information .',
      softWrap: true,
    ),
  );

  final titleSection = new Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Azimut 50\' Detail Information',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'EEUU',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        /*3*/
       /*  ButtonTheme(
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
        ),*/
      ],
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
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Align(
              alignment: Alignment.bottomLeft,
              child: onTopContent,
            ),
          ),
        ],
      ),
    ),

    new Container(
    padding: const EdgeInsets.all(32),
    child: Row(
    children: [
    Expanded(
    /*1*/
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    /*2*/
    Container(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
    'Azimut 50\' Detail Information',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    Text(
    'EEUU',
    style: TextStyle(
    color: Colors.grey[500],
    ),
    ),
    ],
    ),
    ),
    /*3*/
    ButtonTheme(
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
    MaterialPageRoute(builder: (context) => ScreenR(),
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
    ],
    ),
    ),
          textSection,

        ],
      ),
    );

  }

}