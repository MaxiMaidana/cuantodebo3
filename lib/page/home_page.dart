import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  int _monto = 0;
  int _contador = 0;
  String _nombre = '';
  Map<String,int> _personasMap = {};
  List<String> _lista1;
  List<int> _lista2;
  List _lista3;
  final myController = TextEditingController();
  final myControllerInt = TextEditingController();

  @override
  void dispose() {
    // Limpia el controlador cuando el widget se elimine del árbol de widgets
    myController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cuanto Debo'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView(
          children:[
              new Material(
                child: new Container (
                  padding: const EdgeInsets.all(10.0),
                  child: new Container(
                    child: new Center(
                      child: new Column(
                        children: [
                          new Padding(padding: EdgeInsets.only(top: 100.0)),
                          new Text('Ingrese su nombre',
                          style: new TextStyle(
                            color: Colors.orange, fontSize: 25.0
                            ),
                          ),
                          new Padding(padding: EdgeInsets.only(top: 50.0)),
                          formularioString('Dale rata, pone tu nombre'),
                          new Padding(padding: EdgeInsets.only(top: 20.0)),
                          formularioNumero('haber cuanto pusiste ya.'),
                        ]
                      )
                    ),
                  )
                )
              ),
           Divider(),
           botonDeEnviar()
          ]
        ),
        floatingActionButton: botones(),
      )
    );
  }


  Widget botones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30),
        FloatingActionButton(
            onPressed: (){
              _lista1.add(_nombre);
              _lista2.add(_monto);
            },
            child: Icon(Icons.cloud_done)
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton(
            onPressed: (){
              return _mostrarAlerta(context);
            },
            child: Icon(Icons.add)
        )
      ],
    );
  }

  void _mostrarAlerta(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,


    );
  }

  Widget formularioString(String text){

    return new TextField(
      controller: myController,
      decoration: new InputDecoration(
        icon: Icon(Icons.account_circle),
        suffixIcon: Icon(Icons.accessibility_new),
        labelText: text,
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(
          ),
        ),
        //fillColor: Colors.green
      ),
      keyboardType: TextInputType.text,
      style: new TextStyle(
        fontFamily: "Poppins",
      ),
      onChanged: (valor){
        _nombre = valor;
      },

    );
  }

  Widget formularioNumero(String text){

    return new TextField(
      controller: myControllerInt,
      decoration: new InputDecoration(
        icon: Icon(Icons.mouse),
        suffixIcon: Icon(Icons.euro_symbol),
        labelText: text,
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: new BorderSide(
          ),
        ),
        //fillColor: Colors.green
      ),
      keyboardType: TextInputType.number,
      style: new TextStyle(
        fontFamily: "Poppins",
      ),
      onChanged: (valor){
        _monto = valor as int;
      },
    );
  }

  Widget botonDeEnviar(){

    return Center(
      child: RaisedButton(
          child: Text('Cargar al raton'),
          color: Colors.blueAccent,
          textColor: Colors.white,
          padding: EdgeInsets.all(15.0),
          shape: StadiumBorder(),
          onPressed: (){

          }
      ),
    );
  }






}


