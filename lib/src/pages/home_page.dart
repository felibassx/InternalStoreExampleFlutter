import 'package:flutter/material.dart';
import 'package:preferenciausuarioapp/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciausuarioapp/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();
  
  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
        title: Text('Preferencias de Usuario'),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color Secundario: ${ prefs.colorSecundario ? 'si' : 'no' }'),
          Divider(),
          Text('Genero: ${ (prefs.genero == 1) ? 'Masculino' : 'Femenino' }'),
          Divider(),
          Text('Nombre de Usuario: ${ prefs.nombre }'),
          Divider(),
        ],
      ),
    );
  }


}

