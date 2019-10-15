import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

// ...


class BasicDateField extends StatelessWidget {
  final format = DateFormat("MM/dd/yyyy");
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
      Text('Date',
          style: TextStyle(
            fontFamily: "Segoe UI",
            color: const Color (0xFF585858),
            fontSize: 19.0,
          )
      ),
      DateTimeField(
        format: format,
        textAlign: TextAlign.right,
        style: new TextStyle(
          fontWeight: FontWeight.bold,
           fontSize: 17.0,
            fontFamily: 'Segoe UI',
            color: const Color(0xFF5DBCE0)),
      decoration: InputDecoration(contentPadding: EdgeInsets.all(8),
        fillColor: Colors.white30,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(8.0),
          borderSide: new BorderSide(
          ),
        ),
       // labelText: "Date",
      ),
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Pickup time',
          style: TextStyle(
            fontFamily: "Segoe UI",
            color: const Color (0xFF585858),
            fontSize: 19.0,
          )
      ),
      DateTimeField(
        format: format,
        textAlign: TextAlign.right,
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
            fontFamily: 'Segoe UI',
            color: const Color(0xFF5DBCE0)),
      decoration: InputDecoration(contentPadding: EdgeInsets.all(8),
        fillColor: Colors.white30,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(8.0),
          borderSide: new BorderSide(
          ),
        ),
       // labelText: "Time",
      ),
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.convert(time);
        },
      ),
    ]);
  }
}

class BasicTimeField2 extends StatelessWidget {
  final format = DateFormat("HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Guest',
          style: TextStyle(
              fontFamily: "Segoe UI",
              color: const Color (0xFF585858),
              fontSize: 19.0,
          )
      ),
      DateTimeField(
        format: format,
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
            fontFamily: 'Segoe UI',
            color: const Color(0xFF5DBCE0)),
        decoration: InputDecoration(contentPadding: EdgeInsets.all(8),
          fillColor: Colors.white30,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(8.0),
            borderSide: new BorderSide(
            ),
          ),
       //   labelText: "Time",
        ),
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.convert(time);
        },
      ),
    ]);
  }
}

class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic date & time field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
              TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
      ),
    ]);
  }
}

class DateTimeField1 extends StatefulWidget{
  @override
  _DateTimeState1 createState() => new _DateTimeState1();
}

class _DateTimeState1 extends State<DateTimeField1> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Name here")
        ),
        body: new Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

                new Flexible(
           child: BasicDateField(),

    ),
    new Flexible(
    child: BasicTimeField(),
    ),
          ],
        ),
    );
  }
}