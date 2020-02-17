import 'package:flutter/material.dart';
import 'speech.dart';
import 'panodio.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: rowOrColumn(),
      ),
    );
  }

  listen() async {
    controller.text = await Speech().listen();
    setState(() {});
  }

  Widget rowOrColumn() {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait)
        return Column(children: children());
      else
        return Row(children: children());
    });
  }

  List<Widget> children() {
    return <Widget>[
      Spacer(),
      ButtonTheme(
        buttonColor: Colors.yellow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minWidth: 200,
        height: 200,
        child: RaisedButton(
          onPressed: () => listen(),
          child: Text(
            "Escucha y repite",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      Spacer(),
      Container(
        width: 200.0,
        child: TextField(
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'ingrese un texto'),
//                onChanged: (value) => text = value,
          controller: controller,
        ),
      ),
      Spacer(),
      ButtonTheme(
        buttonColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minWidth: 200,
        height: 200,
        child: RaisedButton(
          onPressed: () => Panodio(command: controller.text),
          child: Text(
            "Leer en voz alta!",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      Spacer(),
    ];
  }
}
