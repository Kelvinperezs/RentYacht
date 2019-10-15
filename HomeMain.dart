import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seawise_app/FavoriteWidget.dart';
import 'package:seawise_app/ListViewYacht.dart';
import 'package:seawise_app/model/SelectedButton.dart';
import 'package:seawise_app/yachts.dart';

import 'listYacht.dart';

/*
These are the sample list for demo
 */
List<ItemST> mainList = List();
List<ItemST> stAmericaList = [
  ItemST("1", "BAHAMAS", "assets/images/Bahamas.jpg"),
  ItemST("2", "CANCUN", "assets/images/Cancun.jpg"),
  ItemST("3", "FORT LAUDERDALE", "assets/images/FortLauderdale.jpg"),
  ItemST("4", "MIAMI", "assets/images/Miami.jpeg"),
  ItemST("5", "NEW YORK", "assets/images/NuevaYork.jpg"),
  ItemST("6", "THE HAMPTONS", "assets/images/Hampton.jpg")
];
List<ItemST> stEuropaList = [
  ItemST("1", "AMALFI", "assets/images/Almafi.jpg"),
  ItemST("2", "CROATIA", "assets/images/Croatia.jpg"),
  ItemST("3", "DUBAI", "assets/images/Dubai.jpg"),
  ItemST("4", "IBIZA", "assets/images/Ibiza.jpg"),
  ItemST("5", "MYKONOS GREECE", "assets/images/Mykonos.jpg"),
];
List<ItemST> sampleKidsList = [
  ItemST("1", "kids 1", "assets/images/Miami.jpg"),
  ItemST("2", "kids 2", "assets/images/Miami.jpg"),
  ItemST("3", "kids 3", "assets/images/Miami.jpg")
];

class HomeMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeMain();
  }
}

class _HomeMain extends State<HomeMain> with SingleTickerProviderStateMixin{
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

  bool pressContinent = true;
  bool pressContinent1 = true;
  bool pressTContinent = true;
  bool pressTContinent1 = true;

  bool _isFavorited = true;
  TabController controller;
  @override
  void initState() {
    super.initState();
    mainList.addAll(stAmericaList);
    controller = new TabController(length: 3, vsync: this);
  }

  void dispoise(){
    controller.dispose();
    super.dispose();
  }







  @override
  Widget build(BuildContext context) {


    return Scaffold(
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
       /* title: new Center (
          child: new Text("Seawise",
            style: new TextStyle(fontFamily: "Segoe UI", fontSize: 25.0
            ),
          ),
        ),*/
        backgroundColor: const Color(0xFF0F1E40),
        bottom: PreferredSize(
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
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 16),
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
                  height: 50,
                  minWidth: 120,
                  child: RaisedButton(
                    disabledColor: Colors.white30,
                    child: new Text(("AMERICA"),
                      style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w800,
                          fontSize: 16.0,
                          color: pressTContinent ? const Color(0xFF0F1E40) : Colors.white,
                      ),
                    ),
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                    splashColor: const Color(0xFF0f1e40),
                    color: pressContinent ? Colors.white30 : const Color(0xFF0F1E40),
                    onPressed:() {
                      mainList.clear();
                      setState(() {
                        mainList.addAll(stAmericaList);
                        pressContinent = !pressContinent;
                        pressContinent1 = true;
                        pressTContinent = !pressTContinent;
                        pressTContinent1 = true;
                      });
                    },
                  ),),
                  Padding(padding: EdgeInsets.only(left: 10),),
                  ButtonTheme(
                    height: 50,
                    minWidth: 120,
                  child: RaisedButton(
                    disabledColor: Colors.white30,
                    child: new Text(("EUROPE"),
                      style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w800,
                          fontSize: 16.0,
                          color: pressTContinent1 ? const Color(0xFF0F1E40) : Colors.white,
                      ),
                    ),
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                    splashColor: const Color(0xFF0f1e40),
                    color: pressContinent1 ? Colors.white30 : const Color(0xFF0F1E40),
                    onPressed:() {
                      mainList.clear();
                      setState(() {
                        mainList.addAll(stEuropaList);
                        pressContinent1 = !pressContinent1;
                        pressContinent = true;
                        pressTContinent1 = !pressTContinent1;
                        pressTContinent = true;
                     });
                    },
                  ),),
              /*    new OutlineButton(
                    borderSide: BorderSide(
                        color: Colors.red, style: BorderStyle.solid, width: 3.0),
                    child: Text('Logout'),
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator
                            .of(context)
                            .pushReplacementNamed('/landingpage');
                      }).catchError((e) {
                        print(e);
                      });
                    },
                  ),*/
                ],
              ),

            ),
            /*Container(alignment: Alignment.center,
            height: 45,
             margin: EdgeInsets.all(10),
        child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[

                RaisedButton(
                  disabledColor: Colors.white30,
                  child: new Text(("AMERICA"),
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w800,
                        fontSize: 17.0,
                        color: const Color(0xFF0F1E40)
                    ),
                  ),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                  splashColor: const Color(0xFF0f1e40),
                  color: Colors.white30,
                  onPressed:() {
                    mainList.clear();
                    setState(() {
                      mainList.addAll(sampleMenList);
                    });
                  },
                ),
                RaisedButton(
                  disabledColor: Colors.white30,
                  child: new Text(("EUROPE"),
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w800,
                        fontSize: 17.0,
                        color: const Color(0xFF0F1E40)
                    ),
                  ),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                  splashColor: const Color(0xFF0f1e40),
                  color: Colors.white30,
                  onPressed:() {
                    mainList.clear();
                    setState(() {
                      mainList.addAll(sampleMenList);
                    });
                  },
                ),

              ],
            ),
          ),*/


            new Container(
              padding: EdgeInsets.only(top: 70),
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.centerLeft,
              child: ListView.builder(
                itemBuilder: (BuildContext context, index) {
                  return getCard(index);
                },
                itemCount: mainList.length,
              ),
            ),
            /*Container(
            margin: EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  disabledColor: Colors.white30,
                  child: new Text(("EEUU"),
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w800,
                        fontSize: 17.0,
                        color: const Color(0xFF0F1E40)
                    ),
                  ),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                  splashColor: const Color(0xFF0f1e40),
                  color: Colors.white30,
                  onPressed:() {
                    mainList.clear();
                    setState(() {
                      mainList.addAll(sampleMenList);
                    });
                  },
                ),
                FloatingActionButton(
                  onPressed: () {
                    mainList.clear();
                    setState(() {
                      mainList.addAll(sampleMenList);
                    });
                  },
                  heroTag: "btn1",
                  child: Text("Mens"),
                ),
                FloatingActionButton(
                  onPressed: () {
                    mainList.clear();
                    setState(() {
                      mainList.addAll(sampleWomenList);
                    });
                  },
                  heroTag: "btn2",
                  child: Text("Women"),
                ),
                FloatingActionButton(
                  onPressed: () {
                    mainList.clear();
                    setState(() {
                      mainList.addAll(sampleKidsList);
                    });
                  },
                  heroTag: "btn3",
                  child: Text("Kids"),
                )
              ],
            ),
          ),*/
          /*  new OutlineButton(
              borderSide: BorderSide(
                  color: Colors.red, style: BorderStyle.solid, width: 3.0),
              child: Text('Logout'),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator
                      .of(context)
                      .pushReplacementNamed('/landingpage');
                }).catchError((e) {
                  print(e);
                });
              },
            ),*/
          ],
        ),
      ),
    );
  }

  /*
    Get the card item for a list
   */
  getCard(int position) {
    ItemST model = mainList[position];
    return Card(
      margin: EdgeInsets.only(top: 12),
      child: InkWell(
          onTap: ()=> _navigateToListYacht(
              context, model),
        /*onTap: () {
        Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => ListViewYacht(),
       //   builder: (context) => ListYacht(),
       // builder: (context) => Yachts(),
        ),
        );
      },*/
        child: new Column(
            children: <Widget>[
              new Container(width: MediaQuery.of(context).size.width*0.93,
                height: MediaQuery.of(context).size.height*0.25,
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(
                        model._image,
                      ),
                      fit: BoxFit.cover,
                    ),
                    ),
          child: Align(alignment: Alignment.bottomRight,
            child: FavoriteWidget(),
          ),
          /*child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(model._image),
          ),*/
              ),

        new Container(width: MediaQuery.of(context).size.width*0.90,
          alignment: Alignment.bottomLeft,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:<Widget>[
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

    new Flexible(
    child: new Container(
    padding: new EdgeInsets.only(right: 13.0),
    child:
    Text(
    model._name,
    textAlign: TextAlign.left,
    style: TextStyle(fontSize: 25, color: const Color(0xFF5DBCE0),
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.normal),
              /*Text(
              "ID:: "+model._id,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Padding(padding: EdgeInsets.only(left: 5,right: 5)),*/


          ),
        ),
    ),
          ]
        ),
    ]
      ),
      margin: EdgeInsets.all(10),
    )
    ]
    )
      )
    );
  }
}

/*
Custom model
i.e. for itemList
 */
class ItemST {

  String _id, _name, _image;

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }
  get image => _image;

  set image(value){
    _image = value;
  }

  ItemST(this._id, this._name, this._image);
}

Widget _profile(String name){
  return Container(
    width: 110,
    height: 80,
    margin: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          disabledColor: Colors.white30,
          child: new Text(("AMERICA"),
            style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w800,
                fontSize: 17.0,
                color: const Color(0xFF0F1E40)
            ),
          ),
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
          splashColor: const Color(0xFF0f1e40),
          color: Colors.white30,
          onPressed:() {print("Hola");},
        ),
        RaisedButton(
          disabledColor: Colors.white30,
          child: new Text(("EUROPA"),
            style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w800,
                fontSize: 17.0,
                color: const Color(0xFF0F1E40)
            ),
          ),
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
          splashColor: const Color(0xFF0f1e40),
          color: Colors.white30,
          onPressed:() {print("Hola");},
        ),
      ],
    ),
  );
}
void _navigateToListYacht(BuildContext context, ItemST model) async {
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ListViewYacht(model)),
  );
}


