import 'package:aeroinfraero/navegation/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'aeroportos_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar Aeroportos'),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ConutryPicker(),
      ),
    );
  }
}

class ConutryPicker extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _form2Key = GlobalKey<FormState>();
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingEstadoController = TextEditingController();

  static const listaCidades = [
    'São Paulo',
    'Curitiba',
    'Belo horizonte',
    'Rio de Janeiro',
    'Porto Alegre',
    'Campinas',
    'Goiânia',
    'Manuas',
    'Cuiabá',
    'Campo Grande',
    'Fortaleza',
    'Florianópolis',
    'Palmas'
  ];
  static const listaEstados = [
    'SP',
    'PR',
    'MG',
    'RJ',
    'RS',
    'GO',
    'AM',
    'MT',
    'MS',
    'CE',
    'SC',
    'TO'
  ];

  @override
  Widget build(BuildContext context) {
    _HomeScreenState home = _HomeScreenState();
    var e;
    var c;
    final dw = MediaQuery.of(context).size.width / 100;
    final dh = MediaQuery.of(context).size.width / 100;
    return SingleChildScrollView(
      child: Container(
        height: dh * 60,
        padding: EdgeInsets.symmetric(horizontal: dw * 4, vertical: dh * 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  'Cidade',
                  style: TextStyle(
                    fontSize: dw * 4,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                height: dh * 2,
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Container(
                    height: dh * 7,
                    margin: EdgeInsets.symmetric(vertical: dh * 1),
                    child: TypeAheadFormField(
                      suggestionsCallback: (pattern) => listaCidades.where(
                        (item) =>
                            item.toLowerCase().contains(pattern.toLowerCase()),
                      ),
                      itemBuilder: (_, String item) => ListTile(
                        title: Text(item),
                      ),
                      onSuggestionSelected: (String val) {
                        this._textEditingController.text = val;
                        c = this._textEditingController.text;
                        print(val);
                      },
                      getImmediateSuggestions: true,
                      hideSuggestionsOnKeyboardHide: false,
                      hideOnEmpty: false,
                      noItemsFoundBuilder: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Item não encontrado'),
                      ),
                      textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                          hintText: 'Digite sua cidade aqui...',
                          border: OutlineInputBorder(),
                        ),
                        controller: this._textEditingController,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Estado',
                  style: TextStyle(
                    fontSize: dw * 4,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                height: dh * 2,
              ),
              Expanded(
                child: Form(
                  key: _form2Key,
                  child: Container(
                    height: dh * 7,
                    margin: EdgeInsets.symmetric(vertical: dh * 1),
                    child: TypeAheadFormField(
                      suggestionsCallback: (pattern) => listaEstados.where(
                        (item) =>
                            item.toLowerCase().contains(pattern.toLowerCase()),
                      ),
                      itemBuilder: (_, String item) => ListTile(
                        title: Text(item),
                      ),
                      onSuggestionSelected: (String val) {
                        this._textEditingEstadoController.text = val;
                        e = this._textEditingEstadoController.text;
                        print(val);
                      },
                      getImmediateSuggestions: true,
                      hideSuggestionsOnKeyboardHide: false,
                      hideOnEmpty: false,
                      noItemsFoundBuilder: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Item não encontrado'),
                      ),
                      textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                          hintText: 'Digite sua cidade aqui...',
                          border: OutlineInputBorder(),
                        ),
                        controller: this._textEditingEstadoController,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: dh * 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          child: Text('Buscar'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AeroportosScreen(
                                          cidade: c,
                                          estado: e,
                                        )));
                          },
                        ),
                        Padding(padding: EdgeInsets.only(right: 20)),
                        ElevatedButton(
                            child: Text('Limpar'),
                            onPressed: () {
                              _textEditingController.clear();
                              _textEditingEstadoController.clear();
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
