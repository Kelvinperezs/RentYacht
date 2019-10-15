import 'package:flutter/material.dart';

//services
import 'services/usermanagement.dart';
import 'package:firebase_auth/firebase_auth.dart';




class SignUpPage extends StatefulWidget{


  @override
  _SignUpPageState createState() => _SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage>{
  String _email;
  String _mobileNumber;
  String _password;
  String _passwordConfirm;
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfController = TextEditingController();


  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        height: 700.0,
        child: ListView(
          children: <Widget>[
            new Container(
              height: 300.0,
              child: new Stack(
                children: <Widget>[
                  new Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/registerIMG.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  new Container(
                    padding: new EdgeInsets.all(10.0),
                  ),
                ],
              ),
            ),
            new Container(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
              new Stack(
              children: <Widget>[

    Container(
    padding: EdgeInsets.only(top: 2.0, bottom:20.0 ,right:25.0 , left:25.0 ),
    child: Center(

    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Row(
    children: <Widget>[

    Text("E-mail",
    textAlign: TextAlign.left,
    style: TextStyle(
    fontFamily: 'Segoe UI',
    fontSize: 16,
    ),
    ),
    Padding(padding: EdgeInsets.only(bottom: 30)),
    ],
    ),


    TextField(
    controller: emailController,
    style: new TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    fontFamily: 'Segoe UI',
    color: const Color(0xFF0F1E40)),
    decoration: InputDecoration(
    hintText: "E-mail",
    labelText: "",
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: const Color(0xFF0F1E40), width: 3.0),
    ),
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black45),
    ),
    ),
    onChanged: (value){
    setState(() {
    _email = value;
    });
    }
    ),
    SizedBox(height: 35.0),
      Row(
        children: <Widget>[

          Text("Mobile Number",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 16,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30)),
        ],
      ),


      TextField(
          controller: mobileController,
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              fontFamily: 'Segoe UI',
              color: const Color(0xFF0F1E40)),
          decoration: InputDecoration(
            hintText: "Mobile Number",
            labelText: "",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          onChanged: (value){
            setState(() {
              _mobileNumber = value;
            });
          }
      ),
      SizedBox(height: 35.0),

    Row(
    children: <Widget>[
    Text("Password",
    textAlign: TextAlign.left,
    style: TextStyle(
    fontFamily: 'Segoe UI',
    fontSize: 16,
    ),
    ),
    Padding(padding: EdgeInsets.only(bottom: 30)),
    ],
    ),


    TextField(
    controller: passwordController,
    style: new TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    fontFamily: 'Segoe UI',
    color: const Color(0xFF0F1E40)),
    decoration: InputDecoration(
    hintText: "Password",
    labelText: "",
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: const Color(0xFF0F1E40), width: 3.0),
    ),
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black45),
    ),
    // borderSide: BorderSide(color: const Color(0xFF0F1E40)),
    // borderRadius: new BorderRadius.circular(5.0),

    ),
    onChanged: (value){
    setState(() {
    _password = value;
    });
    },
    obscureText: true,
    ),

      SizedBox(height: 35.0),

      Row(
        children: <Widget>[
          Text("Confirm Password",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 16,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30)),
        ],
      ),


      TextField(
        controller: passwordConfController,
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            fontFamily: 'Segoe UI',
            color: const Color(0xFF0F1E40)),
        decoration: InputDecoration(
          hintText: "Password Confirm",
          labelText: "",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFF0F1E40), width: 3.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45),
          ),
          // borderSide: BorderSide(color: const Color(0xFF0F1E40)),
          // borderRadius: new BorderRadius.circular(5.0),

        ),
        onChanged: (value){
          setState(() {
            _passwordConfirm = value;
          });
        },
        obscureText: true,
      ),
           /* new Stack(
              children: <Widget>[

                Container(
                  padding: EdgeInsets.all(25.0),
                  child: Center(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                            decoration: InputDecoration(
                                hintText: "Email"
                            ),
                            onChanged: (value){
                              setState(() {
                                _email = value;
                              });
                            }
                        ),
                        SizedBox(height: 15.0),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Password"
                          ),
                          onChanged: (value){
                            setState(() {
                              _password = value;
                            });
                          },
                          obscureText: true,
                        ),*/
                        SizedBox(height: 15.0),

                        SizedBox(height: 10.0),
                        RaisedButton(
                          onPressed: (){
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(email: _email, password: _password)
                                .then((signedInUser) {
                              UserManagement().storeNewUser(signedInUser, context);
                            }).catchError((e) {
                              print(e);
                            });
                          },
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(0.0),
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            height: 60,
                            width: 1000,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: <Color>[
                                      Color(0xFF1A3063),
                                      Color(0xFF0F1E40),
                                    ],
                                    stops: [0.1,0.9],
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10.0))
                            ),
                            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                            child: Center(
                                child: Text('Register',
                                style: TextStyle(fontSize: 15,
                                    fontFamily: 'Segoe UI')
                            ),
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<String> createUser(String email, String password) async {
    final AuthResult authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = authResult.user;
    print("created user " + user.email);
    return user.email;
  }
}