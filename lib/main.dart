import 'package:flutter/material.dart';

void main() { 
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;

  String _imgFont = "img/helloThere.jpg";

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0)
        _imgFont = "img/palpatine.jpg";
      else if (_people >= 0 && _people <= 2)
        _imgFont = "img/helloThere.jpg";
      else {
        _imgFont = "img/obiwan.jpg";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "img/sithTemple.png",
          fit: BoxFit.cover,
          height: 1080.0,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text("Siths: $_people",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.blue.withOpacity(0.04);

                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed))
                          return Colors.blue.withOpacity(0.12);

                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  onPressed: () {
                    _changePeople(1);
                  },
                  child: Text('+1',
                      style: TextStyle(fontSize: 40.0, color: Colors.white))),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.blue.withOpacity(0.04);

                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed))
                          return Colors.blue.withOpacity(0.12);

                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  onPressed: () {
                    _changePeople(-1);
                  },
                  child: Text('-1',
                      style: TextStyle(fontSize: 40.0, color: Colors.white))),
            ),
          ]),
          Image.asset(
            _imgFont,
            width: 300.0,
          ),
        ])
      ],
    );
  }
}
