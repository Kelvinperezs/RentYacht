import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'ScreenReservation.dart';
import 'model/product.dart';
import 'product_reservation.dart';
import 'package:carousel_slider/carousel_slider.dart';


class ProductInformation extends StatefulWidget {
  final Product product;
  ProductInformation(this.product);
  @override
  _ProductInformationState createState() => _ProductInformationState();
}

final productReference = FirebaseDatabase.instance.reference().child('CONTINENTS');

class _ProductInformationState extends State<ProductInformation> {

  List<Product> items;

  String productImage;//nuevo



  @override
  void initState() {
    super.initState();
    productImage = widget.product.mainImage;//nuevo
    print(productImage);//nuevo
    final arrayImages = [productImage, widget.product.altImage1,widget.product.altImage2,widget.product.altImage3,widget.product.altImage4,
      widget.product.altImage5,widget.product.altImage6,widget.product.altImage7,widget.product.altImage8,widget.product.altImage9];
  }






  @override
  Widget build(BuildContext context) {
   final viewImg = new CarouselSlider(
      viewportFraction: 0.9,
      initialPage: 0,
      aspectRatio: 16/9,
      items: [productImage,widget.product.altImage1,widget.product.altImage2,
        widget.product.altImage3,widget.product.altImage4,
        widget.product.altImage5,widget.product.altImage6,
        widget.product.altImage7,widget.product.altImage8,
        widget.product.altImage9].map((images) {
        return new Builder(
          builder: (BuildContext context) {
            return new Card(
                child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: new Image.network(images,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,)
                )
            );
          },
        );
      }).toList(),
      height: 400.0,
      reverse: false,
      autoPlay: true,
      autoPlayCurve: Curves.ease,
      autoPlayAnimationDuration: const Duration(milliseconds: 100),
    );


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
        height: 1000.0,
        child: ListView(
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.all(3.0),
              height: 250.0,
              child: viewImg,
              /*new Stack(
                children: <Widget>[
                  ListView(padding: EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                      children:[
                    Card(
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(productImage),
                  ),
                   ),
                        Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(widget.product.altImage1),
                          ),
                        ),
                        Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(widget.product.altImage2),
                          ),
                        ),
                        Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(widget.product.altImage3),
                          ),
                        ),
                        Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(widget.product.altImage4),
                          ),
                        ),
                        Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(widget.product.altImage5),
                          ),
                        ),
                        Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(widget.product.altImage6),
                          ),
                        ),
                        Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(widget.product.altImage7),
                          ),
                        ),
                        Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(widget.product.altImage8),
                          ),
                        ),
                        Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(widget.product.altImage9),
                          ),
                        ),
                      ]),

                  new Container(
                    padding: new EdgeInsets.all(10.0),
                    child: new Align(
                      alignment: Alignment.bottomLeft,
                     // child: onTopContent,
                    ),
                  ),
                ],
              ),*/
            ),

            new Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    /*1*/
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*2*/
                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text("${widget.product.name}", 
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w900,
                            color: const Color(0xFF0F1E40),
                            fontFamily: 'Segoe UI'
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Full Day ',
                            style: TextStyle(
                              fontSize: 15,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Segoe UI',
                                color: const Color(0xFF0F1E40)),
                            children: <TextSpan>[
                              TextSpan(text: '${widget.product.day}',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: const Color(0xFF5DBCE0)
                                )
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 2),),
                        RichText(
                          text: TextSpan(
                            text: 'Half day ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Segoe UI',
                                color: const Color(0xFF0F1E40)),
                            children: <TextSpan>[
                              TextSpan(text: '${widget.product.half}',
                                  style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: const Color(0xFF5DBCE0)
                                  )
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 2),),
                        RichText(
                          text: TextSpan(
                            text: 'Or Weekly ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Segoe UI',
                                color: const Color(0xFF0F1E40)),
                            children: <TextSpan>[
                              TextSpan(text: '${widget.product.week}',
                                  style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: const Color(0xFF5DBCE0)
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*3*/
                  RaisedButton(
                    onPressed: () => _navigateToProductReservation(context, widget.product),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF5DBCE0),
                                Color(0xFF3298BF),
                              ],
                              stops: [0.1,0.9],
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter
                          ),
                      ),
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                      child: Center( child: Text(
                          'Reserve',
                          style: TextStyle(fontSize: 18,
                              fontFamily: 'Segoe UI')
                      ),),
                    ),
                  ),
                 /* ButtonTheme(
                    minWidth: 150,
                    height: 50.0,
                    child: RaisedButton(
                      elevation: 4,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(4.0)
                      ),
                      color: const Color(0xFF3298BF),
                      onPressed: () => _navigateToProductReservation(context, widget.product),
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
            ),
            Container(
              padding: const EdgeInsets.only(top: 32, left: 20, right: 20),
              child: Text(
                '${widget.product.description}',
                softWrap: true,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF0F1E40),
                    fontFamily: 'Segoe UI'
                ),
              ),
            ),




            Container(
              height: 150,
              padding: const EdgeInsets.only(top: 32, left: 20, right: 20),
              child: GridView.count(
                // Crea una grid con 2 columnas. Si cambias el scrollDirection a
                // horizontal, esto produciría 2 filas.
                shrinkWrap: true,
                crossAxisCount: 3,
              children:[
              Text(
                '${widget.product.specs}',
                softWrap: true,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF0F1E40),
                    fontFamily: 'Segoe UI'
                ),
              ),
                Text(
                  '${widget.product.specs2}',
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF0F1E40),
                      fontFamily: 'Segoe UI'
                  ),
                ),
                Text(
                  '${widget.product.features}',
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF0F1E40),
                      fontFamily: 'Segoe UI'
                  ),
                ),
              ])

              /*Text(
                '${widget.product.specs}',
                softWrap: true,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF0F1E40),
                    fontFamily: 'Segoe UI'
                ),
              ),*/
            ),

            /*  Table(children: [
                TableRow(children: [
                  TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${widget.product.specs}'.toString(),
                          softWrap: true,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF0F1E40),
                              fontFamily: 'Segoe UI'
                          ),
                        ),
                      ],
                    ),
                  )
                ])
              ],),*/

// child: GridView.count(crossAxisCount: 2,children: <Widget>[],),
            Divider(color: Colors.grey, height: 100,),

            /*new CarouselSlider(
                viewportFraction: 0.8,
                initialPage: 0,
                aspectRatio: 16/9,
                items: [productImage,widget.product.altImage1,widget.product.altImage2,
                  widget.product.altImage3,widget.product.altImage4,
                  widget.product.altImage5,widget.product.altImage6,
                  widget.product.altImage7,widget.product.altImage8,
                  widget.product.altImage9].map((images) {
                  return new Builder(
                    builder: (BuildContext context) {
                      return new Container(
                          width: MediaQuery.of(context).size.width,
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: new BoxDecoration(
                              color: Colors.amber
                          ),
                          child: new Image.network(images)
                      );
                    },
                  );
                }).toList(),
                height: 400.0,
                reverse: false,
                autoPlay: true,
                autoPlayCurve: Curves.ease,
                autoPlayAnimationDuration: const Duration(milliseconds: 100),
            )*/
          ],
        ),
      ),
    );
  }
  void _navigateToProductReservation(BuildContext context, Product product) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductReservation(product)),
    );
  }
}


