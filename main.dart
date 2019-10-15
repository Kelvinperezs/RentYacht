import 'package:flutter/material.dart';
import 'package:seawise_app/PaymentPage.dart';
import 'package:seawise_app/PaymentScreen.dart';
import 'package:seawise_app/YachtListPrueba.dart';
import 'package:seawise_app/listYacht.dart';
import 'ListViewYacht.dart';
import 'LoginPage.dart';
import 'SignUpPage.dart';
import 'principal.dart';
import 'pruebaCities.dart';
import 'BuildData.dart';
import 'HomeMain.dart';
import 'Reservation.dart';
import 'ScreenDetail.dart';
import 'ScreenReservation.dart';
import 'dateBuild.dart';
import 'Location.dart';
import 'home.dart';
import 'Location2.dart';
import 'yachts.dart';



void main() => runApp(new Seawise());

class Seawise extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seawise Yacht',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Segoe UI'),
      home: BaseLayout(),
      routes: <String, WidgetBuilder> {
        '/landingpage': (BuildContext context)=> new Seawise(),
        '/signup': (BuildContext context)=> new SignUpPage(),
        '/homepage': (BuildContext context)=> new HomeMain()
      },
    );
  }

}

class BaseLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
          children: <Widget>[
        new GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage(),
          ),
          );
    },
           child: Container(
             width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("assets/images/bienvenida.jpg"), fit: BoxFit.cover,),
              ),
            ),
        ),
    /* Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage(),
                        ),
                      );

                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF5DBCE0),
                                Color(0xFF3298BF),
                              ],
                              stops: [0.3,0.6],
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                      child: Center( child: Text(
                          'ENTER',
                          style: TextStyle(fontSize: 20,
                              fontFamily: 'Segoe UI')
                      ),),
                    ),
                  ),


                  /*             RaisedButton(

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage(),
                        ),
                      );

                    },
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF5DBCE0),
                            Color(0xFF3298BF),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child:
                      const Text('ENTER', style: TextStyle(fontSize: 20, color: Colors.white,)),
                    ),


                  ),*/
                ],
              ),
            ),*/

            //   new Center(
            //   child: new Text("Hello background"),
            //  )
          ],
        )
    );
  }
}

class Drawhorizontalline extends CustomPainter {
  Paint _paint;

  Drawhorizontalline() {
    _paint = Paint()
      ..color = const Color(0xFF727680)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(-800.0, 0.0), Offset(800.0, 0.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
/*  child: Column(
          children: <Widget>[
            new Stack(
              children: <Widget>[
              new Container(
                height: 60.0,
                width: 60.0,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(50.0),
                  color: Colors.green
                ),
              )
            ],
            )
          ],
        ),
      ),
    );
  }

}*/
