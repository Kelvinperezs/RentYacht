import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'FavoriteWidget.dart';
import 'HomeMain.dart';
import 'model/product.dart';
import 'product_information.dart';

class ListViewYacht extends StatefulWidget {
  final ItemST model;
  ListViewYacht(this.model);
  @override
  _ListViewYachtState createState() => _ListViewYachtState();
}


final productReference = FirebaseDatabase.instance.reference().child('CONTINENTS');

class _ListViewYachtState extends State<ListViewYacht> with SingleTickerProviderStateMixin{

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        //  _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        //  _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }


  bool pressTAttention = true;
  bool pressTAttention2 = true;
  bool pressTAttention3 = true;
  bool pressAttention = true;
  bool pressAttention2 = true;
  bool pressAttention3 = true;
  bool _isFavorited = true;

  TabController controller;
  List<Product> items, items2;
  StreamSubscription<Event> _onProductAddedSubscription;
  StreamSubscription<Event> _onProductChangedSubscription;


  @override
  void initState() {
    super.initState();
    items = new List();
    items2 = new List();
    _onProductAddedSubscription =
        productReference.onChildAdded.listen(_onProductAdded);
    _onProductChangedSubscription =
        productReference.onChildChanged.listen(_onProductUpdate);

    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _onProductAddedSubscription.cancel();
    _onProductChangedSubscription.cancel();

    controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator
                      .of(context)
                      .pushReplacementNamed('/landingpage');
                }).catchError((e) {
                  print(e);
                });
              },
            ),
          ],
          backgroundColor: const Color(0xFF0F1E40),
          bottom:
    PreferredSize(
    preferredSize: const Size.fromHeight(23.0),
    child: new TabBar(
              controller: controller,
              tabs: <Tab>[
                new Tab(icon: new Icon(Icons.menu)),
                new Tab(icon: new Icon(Icons.perm_identity)),
                new Tab(icon: new Icon(Icons.search)),
              ]
          ),
        ),
        ),
        body: new Container(
    child: Stack(
    children: <Widget>[
    new  Container(
      height: 40,
      margin: EdgeInsets.only(top:16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
    /*SelectedButton(
                    radius: 30.0,
                    unselectedButtonColor: Colors.white,
                    selectedButtonColor: Colors.teal,
                    text: 'Selected Button',
                    unselectedTextColor: Colors.teal,
                    selectedTextColor: Colors.white,
                    textFontWeight: FontWeight.bold,
                    onPressed: () {mainList.clear();
    setState(() {
    mainList.addAll(stAmericaList);});},
                  ),*/

          Padding(padding: EdgeInsets.only(right: 10),),
    ButtonTheme(
    height: 45,
    minWidth: 105,
    child: RaisedButton(
    disabledColor: Colors.white30,
    child: new Text(("Full Day"),
    style: TextStyle(
    fontFamily: "Segoe UI",
    fontWeight: FontWeight.w800,
    fontSize: 16.0,
    color: pressTAttention ? const Color(0xFF0F1E40) : Colors.white,
    ),
    ),
    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
    splashColor: const Color(0xFF0f1e40),
    color: pressAttention ? Colors.white30 : const Color(0xFF0F1E40),
    onPressed:() {
      _deleteProductFull();
    },
    ),),
    Padding(padding: EdgeInsets.only(right: 10),),
    ButtonTheme(
    height: 45,
    minWidth: 105,
    child: RaisedButton(
    disabledColor: Colors.white30,
    child: new Text(("Weekly"),
    style: TextStyle(
    fontFamily: "Segoe UI",
    fontWeight: FontWeight.w800,
    fontSize: 16.0,
    color: pressTAttention2 ? const Color(0xFF0F1E40) : Colors.white,
    ),
    ),
    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
    splashColor: const Color(0xFF0f1e40),
      color: pressAttention2 ? Colors.white30 : const Color(0xFF0F1E40),
    onPressed:() {
      _deleteProductWeek();
    },
    ),),
          Padding(padding: EdgeInsets.only(left: 10),),
      ButtonTheme(
        height: 45,
        minWidth: 105,
        child: RaisedButton(
          disabledColor: Colors.white30,
          child: new Text(("Half Day"),
            style: TextStyle(
                fontFamily: "Segoe UI",
                fontWeight: FontWeight.w800,
                fontSize: 16.0,
                color: pressTAttention3 ? const Color(0xFF0F1E40) : Colors.white,
            ),
          ),
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
          splashColor: const Color(0xFF0f1e40),
          color: pressAttention3 ? Colors.white30 : const Color(0xFF0F1E40),
          onPressed:() {
            _deleteProductHalf();
          },
        ),),



    ],
    
    ),

    ),



    Center(
      child:Container(
        padding: EdgeInsets.only(top: 70),
          child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(left: 15,top: 3.0, right: 13),
              itemBuilder: (context, position) {
                return Card(
                    margin: EdgeInsets.only(top: 5),
                  child: InkWell(
                    onTap: ()=> _navigateToProduct(
                    context, items[position]),
                    child: new Column(
                    children: <Widget>[
                    new Container(width: MediaQuery.of(context).size.width*0.95,
                      height: MediaQuery.of(context).size.height*0.25,
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(
                            items[position].mainImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(alignment: Alignment.bottomRight,
                        child: FavoriteWidget(),
                      ),
                      /*child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
          child: Image.asset('${items[position].mainImage}'),
          ),*/
                    ),
                      new Container(
                        width: MediaQuery.of(context).size.width*0.95,
                      alignment: Alignment.bottomLeft,

                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:<Widget>[
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      /*Text(
              "ID:: "+model._id,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Padding(padding: EdgeInsets.only(left: 5,right: 5)),*/
                      new Flexible(
                      child: new Container(
                      padding: new EdgeInsets.only(right: 13.0),
                        child:
                      Text(
                      '${items[position].name}',
                        textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 25, color: const Color(0xFF5DBCE0),
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal),
                      ),
                      ),
                      ),
                      ],
                      ),
                      Padding(padding: EdgeInsets.all(3.0)),

                Row(
                  children: <Widget> [
                Text('Full Day ',
                style: TextStyle(
                fontFamily: 'Segoe UI',
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: const Color(0XFF0F1E40),
                ),),
                Text('${items[position].day}',
                style: TextStyle(
                fontFamily: 'Segoe UI',
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: const Color(0XFF0F1E40),
                ),),
                Padding(padding: EdgeInsets.only(left: 15)),

                Text('Weekly ',
                style: TextStyle(
                fontFamily: 'Segoe UI',
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: const Color(0XFF0F1E40),
                ),),
                Text('${items[position].week}',
                style: TextStyle(
                fontFamily: 'Segoe UI',
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: const Color(0XFF0F1E40),
                ),
                ),
                  Padding(padding: EdgeInsets.only(left: 15)),

                  Text('Half Day ',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: const Color(0XFF0F1E40),
                    ),),
                  Text('${items[position].half}',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: const Color(0XFF0F1E40),
                    ),),
                        ],
                      ),
                    ],
                )
                ),
                   ]
                    ),
                  ),
                );


                /*Column(
                  children: <Widget>[
                    Card(
                    child: Image.network('${items[position].mainImage}'),
                ),

                  Container(
                alignment: Alignment.bottomLeft,

                child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children:<Widget>[
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                /*Text(
              "ID:: "+model._id,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Padding(padding: EdgeInsets.only(left: 5,right: 5)),*/
                Text(
                  '${items[position].name}', textAlign: TextAlign.right,
                style: TextStyle(fontSize: 25, color: const Color(0xFF5DBCE0),
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal),
                ),
                ],
                ),
                Padding(padding: EdgeInsets.all(5.0)),
                Row(children: <Widget> [
                Text('Day: ',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: const Color(0XFF0F1E40),
                  ),),
                Text('${items[position].day}',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: const Color(0XFF0F1E40),
                ),),
                Padding(padding: EdgeInsets.only(left: 15)),
                Text('Week',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: const Color(0XFF0F1E40),
                  ),),
                  Text('${items[position].week}',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: const Color(0XFF0F1E40),
                    ),),
                ]),
                ],
                ),
                    ),
               ]
                );*/
              }),
        ),
    ),
    ]
      ),
    )
      )
    );
  }






                 /* Column(
                  children: <Widget>[
                    Divider(
                      height: 1.0,
                    ),
                    Container(
                      padding: new EdgeInsets.all(3.0),
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            //nuevo imagen
                            new Container(
                              padding: new EdgeInsets.all(5.0),
                              child: '${items[position].mainImage}' == ''
                                  ? Text('No image')
                                  : Image.network(
                                '${items[position].mainImage}',
                                fit: BoxFit.fill,
                                height: 57.0,
                                width: 57.0,
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                  title: Text(
                                    '${items[position].name}',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${items[position].description}',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                  /*onTap: () => _navigateToProductInformation(
                                      context, items[position])*/
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () => _showDialog(context, position),
                            ),

                            //onPressed: () => _deleteProduct(context, items[position],position)),
                            /*IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.blueAccent,
                                ),
                                onPressed: () =>
                                    _navigateToProduct(context, items[position])),*/
                          ],
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                );*/

       /* floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.pinkAccent,
          onPressed: () => _createNewProduct(context),
        ),*/


  //nuevo para que pregunte antes de eliminar un registro
  /*void _showDialog(context, position) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.purple,
              ),
              onPressed: () =>
                  _deleteProduct(context, items[position], position,),
            ),
            new FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
*/

  void _onProductAdded(Event event) {
    var Qry = new Product.fromSnapShot(event.snapshot);
    if(Qry.localizacion == widget.model.name){
      setState(() {
        items.add(new Product.fromSnapShot(event.snapshot));
        items2.add(new Product.fromSnapShot(event.snapshot));
      });
    }
  }


  void _onProductUpdate(Event event) {
    var oldProductValue =
    items.singleWhere((product) => product.id == event.snapshot.value);
    setState(() {
      items[items.indexOf(oldProductValue)] =
      new Product.fromSnapShot(event.snapshot);
    });
  }

 /* void _deleteProduct(
      BuildContext context, Product product, int position) async {
    await productReference.child(product.name).remove().then((_) {
      setState(() {
        items.removeAt(position);
        Navigator.of(context).pop();
      });
    });
  }*/
  void _deleteProductHalf() {
items = items2;
      setState(() {
       items = items.where((product) => product.half != "").toList();
       pressAttention3 = !pressAttention3;
       pressAttention2 = true;
       pressAttention = true;
       pressTAttention3 = !pressTAttention3;
       pressTAttention2 = true;
       pressTAttention = true;


    });
  }

  void _deleteProductFull() {
    items = items2;
    setState(() {
      items = items.where((product) => product.day != "").toList();
      pressAttention = !pressAttention;
      pressAttention2 = true;
      pressAttention3 = true;
      pressTAttention = !pressTAttention;
      pressTAttention2 = true;
      pressTAttention3 = true;

    });
  }

  void _deleteProductWeek() {
    items = items2;
    setState(() {
      items = items.where((product) => product.week != "").toList();
      pressAttention2 = !pressAttention2;
      pressAttention = true;
      pressAttention3 = true;
      pressTAttention2 = !pressTAttention2;
      pressTAttention = true;
      pressTAttention3 = true;

    });
  }
  /*void _navigateToProductInformation(
      BuildContext context, Product product) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductScreen(product)),
    );
  }*/

  void _navigateToProduct(BuildContext context, Product product) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductInformation(product)),
    );
  }

  /*void _createNewProduct(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ProductScreen(Product(null, '', '', '', '', '', ''))),
    );
  }*/


}
