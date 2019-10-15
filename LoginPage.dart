import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//Google Provider
import 'package:google_sign_in/google_sign_in.dart';
//Facebook Provider
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:seawise_app/HomeMain.dart';
import 'package:seawise_app/SignUpPage.dart';
import 'package:seawise_app/stripecard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'RaisedGradientButton.dart';



class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoggedIn = false;

  String email;
  String password;
  String _email;
  String _password;
  @override
  void initState() {
    super.initState();
    getCredential();
  }

 /* @override
  void initState() {
    super.initState();
    autoLogIn();
  }
  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('email');

    if (userId != null) {
      setState(() {
        isLoggedIn = true;
        email = userId;
      });
      return;
    }
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', null);

    setState(() {
      email = '';
      isLoggedIn = false;
    });
  }

  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', emailController.text);

    setState(() {
      email = emailController.text;
      isLoggedIn = true;
    });

    emailController.clear();
  }*/


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  SharedPreferences sharedPreferences;


  //Google Sign In
  GoogleSignIn googleAuth = new GoogleSignIn();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  //Facebook Sign In
  final facebookLogin = new FacebookLogin();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            new Container(
              height: 300.0,
              child: new Stack(
                children: <Widget>[
                  new Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/LoginIMG.jpg"),
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
              padding: const EdgeInsets.only(top: 32, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'Login instantly',
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
            new  Container(
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[

                  //Button FacebookLogin
                  ButtonTheme(
                    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black45, width: 0.5),
                        borderRadius: BorderRadius.circular(5)),
                    height: 60,
                    minWidth: 127,

                    child:   RaisedButton(
                      child: Image.asset("assets/images/FbLogo.jpg",
                          height: 40,
                          width: 127.5
                      ),
                      color: Colors.white,
                      textColor: Colors.white,

                      onPressed: (){


                      },
                    ),),

                  //Button Login with Gmail
                  ButtonTheme(
                    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black45, width: 0.5),
                        borderRadius: BorderRadius.circular(5)),
                    height: 60,
                    minWidth: 127,

                    child: RaisedButton(
                      child: Image.asset("assets/images/google.jpg",
                          height: 40,
                          width: 127.5
                      ),
                      color: Colors.white,
                      textColor: Colors.white,
                      onPressed: () {
                        _handleSignIn()
                            .then((signedInUser) {
                          print('Signed in as ${signedInUser.displayName}');
                          Navigator.of(context).popAndPushNamed('/homepage');
                        }).catchError((e) {
                          print(e);
                        });
                      },
                    ),),
           /*   ButtonTheme(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            height: 60,
            minWidth: 140,

          child:   RaisedButton(
                      child: Image.asset("assets/images/facebookLogo.jpg",
                          height: 35,
                          width: 130
                      ),
                      color: Colors.white,
                      textColor: Colors.white,

                      onPressed: (){


                      },
                    ),),

                  //Button Login with Gmail
      ButtonTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        height: 60,
        minWidth: 140,

        child: RaisedButton(
                      child: Image.asset("assets/images/google.jpg",
                          height: 40,
                          width: 130
                      ),
                      color: Colors.white,
                      textColor: Colors.white,
                      elevation: 7.0,
                      onPressed: () {
                        _handleSignIn()
                            .then((signedInUser) {
                          print('Signed in as ${signedInUser.displayName}');
                          Navigator.of(context).popAndPushNamed('/homepage');
                        }).catchError((e) {
                          print(e);
                        });
                      },
                    ),),*/
                ],
              ),
            ),


              /*new  Container(
              child: ButtonBar(
                  children: <Widget>[
                    ButtonTheme(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      height: 70,

                      child: RaisedButton(
                        child: Image.asset("assets/images/facebookLogo.jpg",
                            height: 50,
                            width: 160
                        ),
                        color: Colors.white,
                        textColor: Colors.white,

                        onPressed: (){


                        },
                      ),
                    ),

                    //Button Login with Gmail
                    ButtonTheme(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      height: 70,

                      child: RaisedButton(
                        child: Image.asset("assets/images/google.jpg",
                            height: 50,
                            width: 160
                        ),
                        color: Colors.white,
                        textColor: Colors.white,
                        elevation: 7.0,
                        onPressed: () {
                          _handleSignIn()
                              .then((signedInUser) {
                            print('Signed in as ${signedInUser.displayName}');
                            Navigator.of(context).popAndPushNamed('/homepage');
                          }).catchError((e) {
                            print(e);
                          });
                        },
                      ),
                    ),
              ],
                  alignment: MainAxisAlignment.spaceEvenly,
              ),
              ),*/

            new Container(
              padding: const EdgeInsets.only(top: 25, bottom: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'or login with email/mobile',
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

                              Text("E-mail ID or Mobile Number",
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
                            onChanged: (val){
                              setState(() {
                                email = val;
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
                          onChanged: (val){
                            setState(() {
                              password = val;
                            });
                          },
                          obscureText: true,
                        ),

                        SizedBox(height: 0.0),
                        Padding(padding: EdgeInsets.only(right: 0, left: 0, top: 1, bottom: 0),
                        child: Row(
                          children: <Widget>[
                        new Transform.scale(
                        scale: 0.75,
                            child: CircularCheckBox(
                                value: isLoggedIn,
                                onChanged: _onChanged,
                              materialTapTargetSize: MaterialTapTargetSize.padded,
                              activeColor: const Color(0xFF0F1E40),

                            ),),
                            Text("Remember me",
                              style: TextStyle(color: Colors.black87,
                                  fontFamily: 'Segoe UI'
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: "          Forgot password?",
                                  style: TextStyle(color: const Color(0xFF072F94), fontWeight: FontWeight.bold, fontFamily: 'Segoe UI'),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Label has been tapped.');
                                    },
                                ),
                              ),
                            ),
                          ],
                        ),),
                      //  new CheckboxListTile(
                        //  value: isLoggedIn,
                          //onChanged: _onChanged,
                          //title: new Text("Remember me"),
                          //secondary: new FlatButton(child: Text("Forgot password?")),
                         // controlAffinity: ListTileControlAffinity.leading,
                        //),


                        //Button Login With Email or Phone
                        SizedBox(height: 30.0),

                        RaisedButton(
                          onPressed: () {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                email: email, password: password).then((val) {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => HomeMain()));
                            })
                                .catchError((e) {
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
                            child: Center( child: Text(
                                'Login to my account?',
                                style: TextStyle(fontSize: 15,
                                fontFamily: 'Segoe UI')
                            ),),
                          ),
                        ),
                     /*   RaisedButton(
                          child: Text("Login"),
                          color: Colors.blue,
                          textColor: Colors.white,
                          elevation: 7.0,
                          onPressed: () {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                email: _email, password: _password)
                                .then((AuthResult auth) {
                              Navigator.of(context).pushReplacementNamed('/homepage');
                            })
                                .catchError((e) {
                              print(e);
                            });
                          }
                        ),*/

                        //Button Login Test
                   /*     RaisedButton(
                            child: Text("LoginTest"),
                            color: Colors.blue,
                            textColor: Colors.white,
                            elevation: 7.0,
                            onPressed: () {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                  email: email, password: password)
                                  .then((val) {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => HomeMain()));
                              })
                                  .catchError((e) {
                                print(e);
                              });
                            }
                        ),*/

                /*        //Button Login with Facebook
                        SizedBox(height: 15.0),
        ButtonTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          height: 70,

                        child: RaisedButton(
                          child: Image.asset("assets/images/facebookLogo.jpg",
                              height: 50,
                              width: 160
                          ),
                            color: Colors.white,
                            textColor: Colors.white,
                            elevation: 7.0,
                            onPressed: (){


                          },
                        ),
        ),

        //Button Login with Gmail
                        SizedBox(height: 15.0),
        ButtonTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                       height: 70,

                       child: RaisedButton(
                            child: Image.asset("assets/images/google.jpg",
                              height: 50,
                              width: 160
                            ),
                            color: Colors.white,
                            textColor: Colors.white,
                            elevation: 7.0,
                            onPressed: () {
                              _handleSignIn()
                                  .then((signedInUser) {
                                    print('Signed in as ${signedInUser.displayName}');
                                    Navigator.of(context).popAndPushNamed('/homepage');
                                  }).catchError((e) {
                                print(e);
                              });
                            },
                        ),


        ),*/
                        SizedBox(height: 25.0),
                    new RichText(
                      text: new TextSpan(text: "Don\'t  have an account?",
                          style: TextStyle(color: Colors.black87,
                            fontFamily: 'Segoe UI'
                          ),
                          children: [
                        new TextSpan(
                          text: "  Register now",
                          style: TextStyle(color: const Color(0xFF072F94), fontWeight: FontWeight.bold, fontFamily: 'Segoe UI'),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = (){
                            Navigator.of(context).pushReplacementNamed('/signup');
                          },
                        ),
                      ],
                      ),
                    ),
                       /* Text("Don\"t  have an account?"), Text("Register now"), */
                      /*  SizedBox(height: 10.0),
                        RaisedButton(
                          child: Text('Sign Up'),
                          color: Colors.blue,
                          textColor: Colors.white,
                          elevation: 7.0,
                          onPressed: (){
                            Navigator.of(context).pushNamed('/signup');
                          },
                        ),*/
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
  Future<FirebaseUser> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    print("signed in " + user.displayName);
    return user;
  }
  Future<FirebaseUser> _handleSignInfb() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    print("signed in " + user.displayName);
    return user;
  }

  // Reset Password
  Future sendPasswordResetEmail(String email) async {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }


  _onChanged(bool value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = value;
      sharedPreferences.setBool("check", isLoggedIn);
      sharedPreferences.setString("email", emailController.text);
      sharedPreferences.setString("password", passwordController.text);
      sharedPreferences.commit();
      getCredential();
    });
  }

  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = sharedPreferences.getBool("check");
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          emailController.text = sharedPreferences.getString("email");
          passwordController.text = sharedPreferences.getString("password");
        } else {
          emailController.clear();
          passwordController.clear();
          sharedPreferences.clear();
        }
      } else {
        isLoggedIn = false;
      }
    });
  }
}
