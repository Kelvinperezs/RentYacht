import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seawise_app/PaymentScreen.dart';
import 'package:seawise_app/stripecard.dart';
import 'PaymentPage.dart';
import 'custom_theme.dart';
import 'BuildData.dart';
import 'model/product.dart';

class ProductReservation extends StatefulWidget {
  final Product product;
  ProductReservation(this.product);



  @override
  _ProductReservationState createState() => _ProductReservationState();
}

final productReference = FirebaseDatabase.instance.reference().child('CONTINENTS');

class _ProductReservationState extends State<ProductReservation> {

  final TextEditingController _orderController = new TextEditingController();
  int radioGroup;
  String yachtOrder = '';
  String yachtOrder1 = '';
  String halfDayEmpty;

  String yachtPrice(String yachtPrice , deleverPrice){
    if(yachtPrice.isNotEmpty && int.parse(yachtPrice) > 0){
      double result = int.parse(yachtPrice) + deleverPrice;
      print(yachtOrder);
      return yachtOrder = '$result';
    }else if(yachtPrice == "") {
      print(radioGroup);
    }else{print('please enter a valid Price !');
    return  yachtOrder =  'please enter a valid Price !' ;}
  }


  void radioEventHandler(int value){
    setState(() {
      radioGroup = value;
      switch(radioGroup){
        case 0:
          yachtPrice(_orderController.text , widget.product.day);
          yachtOrder = 'Full Day :  ${widget.product.day}';
          yachtOrder1 = '${widget.product.day}';
          break;
        case 1:
          yachtPrice(_orderController.text , widget.product.week);
          yachtOrder = 'Weekly :  ${widget.product.week}';
          yachtOrder1 = '${widget.product.week}';
          break;
        case 2:
          if(widget.product.half == ""){yachtOrder = "Please enter a valid Price!";}else {
            yachtPrice(_orderController.text, widget.product.half);
            yachtOrder = 'Half Day :  ${widget.product.half}';
            yachtOrder1 = '${widget.product.half}';
            break;
          }
      }

    });
  }

  List<Product> items;

  String productImage;//nuevo
  @override
  void initState() {
    super.initState();
    productImage = widget.product.mainImage;//nuevo
    print(productImage);//nuevo
  }



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
                ),ºº
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
    preferredSize: Size.fromHeight(75.0),),
    body: new Container(
      padding: new EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height*0.98,
      child: ListView(
        children: <Widget>[
          new Container(width: MediaQuery.of(context).size.width*0.95,
            height: MediaQuery.of(context).size.height*0.25,
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(
                  productImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
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
                            "${widget.product.name}",
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
          ),
          reservationSection,
          timeReservationSection,
          new Padding(padding: EdgeInsets.all(12.0),)  ,

          new Column(
            children: <Widget>[
              new RadioListTile<int>(
                value: 0,
                groupValue: radioGroup,
                onChanged: radioEventHandler ,
                title: new RichText(
                  text: TextSpan(
                    text: 'Full Day ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Segoe UI',
                        color: const Color(0xFF5DBCE0)),
                    children: <TextSpan>[
                      TextSpan(text: '${widget.product.day}',
                          style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: const Color(0xFF5DBCE0)
                          )
                      ),
                    ],
                  ),
                ),
                activeColor: const Color(0xFF0F1E40),
              ),
              new RadioListTile<int>(
                value: 1,
                groupValue: radioGroup,
                onChanged: radioEventHandler ,
                title: new RichText(
                  text: TextSpan(
                    text: 'Weekly ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Segoe UI',
                        color: const Color(0xFF5DBCE0)),
                    children: <TextSpan>[
                      TextSpan(text: '${widget.product.week}',
                          style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: const Color(0xFF5DBCE0)
                          )
                      ),
                    ],
                  ),
                ),
                activeColor: const Color(0xFF0F1E40),
              ),

              new RadioListTile<int>(
                value: 2,
                groupValue: radioGroup,
                onChanged: radioEventHandler,
                title: new RichText(
                  text: TextSpan(
                    text: 'Half Day ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Segoe UI',
                        color: const Color(0xFF5DBCE0)),
                    children: <TextSpan>[
                      TextSpan(text: '${widget.product.half}',
                          style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: const Color(0xFF5DBCE0)
                          )
                      ),
                    ],
                  ),
                ),
                activeColor: const Color(0xFF0F1E40),
              ),
            ],
          ),
         // textSection,
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
                onPressed: () => _navigateToPaymentPage(context, widget.product),

                    //() {
                  //Navigator.push(
                   // context,
                    //MaterialPageRoute(builder: (context) => PaymentScreen(),
                  //  ),
                //  );
                //},
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
    )
    );

  }

  void _navigateToPaymentPage(BuildContext context, Product product) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentPage(product, yachtOrder, yachtOrder1)),
    );
  }


}
