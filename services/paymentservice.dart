import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentService {
addCard(token){
  FirebaseAuth.instance.currentUser().then((user) {
    Firestore.instance
        .collection('cards')
        .document(user.uid)
        .collection('tokens')
        .add({'tokenId': token}).then((val) {
          print('saved');
          //print(user);
          print(token);
          return token;
    });

  });
}

buyItem(price) {
  var processedPrice = price * 100;
  FirebaseAuth.instance.currentUser().then((user){
Firestore.instance.collection('cards').document(user.uid).collection('charges').add({
  'currency':'usd',
  'amount': processedPrice,
  'description': 'Purchase of product',
});
});
}


addCard2(token){
  FirebaseAuth.instance.currentUser().then((user) {
    Firestore.instance
        .collection('cards')
        .document(user.uid)
        .collection('tokens')
        .add({'tokenId': token}).then((val) {
      print('saved');
      //print(user);
      print(token);
      return token;
    });

  });
}



}
