import 'package:flutter/material.dart';
import 'package:preferenciausuarioapp/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciausuarioapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario = true;
  int _genero;
  String _nombre;

  TextEditingController _textController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {

    super.initState();

    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;

    _textController = new TextEditingController(text: prefs.nombre);
    
  }

  

  @override
  Widget build(BuildContext context) {


    prefs.ultimaPagina = SettingsPage.routeName;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
          title: Text('Ajustes'),
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            SwitchListTile(
                value: _colorSecundario,
                title: Text('Color Secundario'),
                onChanged: _setColorSecondary
                
                ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Nombre', helperText: 'Nombre de la persona'),
                onChanged: (value) {
                  prefs.nombre = value;
                },
              ),
            )
          ],
        ));
  }

  void _setSelectedRadio(int value) {

    prefs.genero = value;
    _genero = value;

    setState(() {});
  }

  void _setColorSecondary(bool value) {

    prefs.colorSecundario = value;
    _colorSecundario = value;

    setState(() {});
  }

}
