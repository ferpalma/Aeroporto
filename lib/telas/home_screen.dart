import 'package:aeroinfraero/mock/aeroportoMock.dart';
import 'package:aeroinfraero/models/aeroporto.dart';
import 'package:aeroinfraero/models/companhia.dart';
import 'package:aeroinfraero/models/gerenciaCompanhiasAereas.dart';
import 'package:aeroinfraero/models/infraeros.dart';
import 'package:aeroinfraero/models/voo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'aeroportos_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Infraero infra = Infraero();

  void carregaAeroportos() {
    //  CRIANDO COMPANHIAS AÉREAS
    Companhia? comp1 = Companhia.with_parameters("TAM", 09786);
    Companhia? comp2 = Companhia.with_parameters("GOL", 08769);
    // INSERINDO COMPANHIAS AÉREAS
    GerenciaCompanhiasAereas? gerencia = GerenciaCompanhiasAereas();
    gerencia.insereCompanhia(comp1);
    gerencia.insereCompanhia(comp2);
    //CRIANDO VOOS
    Voo voo1 = Voo.with_parameters(
        "10-05-2022", "15:30", 56543, "Salvador", "Sudeste");
    voo1.setCompanhia(comp1);

    Voo voo2 = Voo.with_parameters(
        "20-07-2021", "19:30", 43555, "Rio de Janeiro", "Sudeste");
    voo2.setCompanhia(comp2);

    Voo voo3 = Voo.with_parameters(
        "10-05-2022", "14:45", 56544, "Florianópolis", "Sul");
    voo3.setCompanhia(comp1);

    Voo voo4 = Voo.with_parameters(
        "26-05-2023", "5:30", 13575, "Brasília", "Centro-Oeste");
    voo4.setCompanhia(comp2);

    Voo voo5 =
        Voo.with_parameters("11-05-2022", "3:45", 12345, "Palmas", "Norte");
    voo5.setCompanhia(comp1);

    Voo voo6 =
        Voo.with_parameters("25-08-2021", "17:50", 54653, "Manaus", "Norte");
    voo6.setCompanhia(comp2);

    Voo voo7 = Voo.with_parameters(
        "26-05-2023", "5:30", 13675, "Campo Grande", "Centro-Oeste");
    voo7.setCompanhia(comp2);

    Voo voo8 =
        Voo.with_parameters("11-05-2022", "3:45", 12945, "Porto Alegre", "Sul");
    voo8.setCompanhia(comp1);

    Voo voo9 = Voo.with_parameters(
        "25-08-2021", "17:50", 54053, "Cuiabá", "Cenro-Oeste");
    voo9.setCompanhia(comp2);

    Voo voo10 = Voo.with_parameters(
        "25-08-2021", "17:50", 65871, "Teresina", "Nordeste");
    voo10.setCompanhia(comp2);

    Voo voo11 =
        Voo.with_parameters("25-08-2021", "17:50", 65871, "Fortaleza", "Norte");
    voo11.setCompanhia(comp1);

    Voo voo12 = Voo.with_parameters(
        "25-08-2021", "17:50", 65871, "Presidente Prudente", "Sudeste");
    voo12.setCompanhia(comp1);

    //CRIANDO AEROPORTOS
    Aeroporto aero1 = Aeroporto.with_parameters(
        "Congonhas", "1322112", "São Paulo", "SP", "Brasil");
    aero1.insereVoo(voo1);
    aero1.insereVoo(voo2);
    aero1.insereVoo(voo3);
    Aeroporto aero2 = Aeroporto.with_parameters(
        "Santos-Dumont", "5867348", "Rio de Janeiro", "RJ", "Brasil");
    aero2.insereVoo(voo4);
    aero2.insereVoo(voo5);
    aero2.insereVoo(voo6);
    Aeroporto aero3 = Aeroporto.with_parameters(
        "Lysias Rodrigues", "3456345", "Palmas", "TO", "Brasil");
    aero3.insereVoo(voo7);
    aero3.insereVoo(voo8);
    aero3.insereVoo(voo9);
    Aeroporto aero4 = Aeroporto.with_parameters(
        "Hercílio Luz", "1322112", "Florianópolis", "SC", "Brasil");
    aero4.insereVoo(voo10);
    aero4.insereVoo(voo11);
    aero4.insereVoo(voo12);

    infra.insereAeroporto(aero1);
    infra.insereAeroporto(aero2);
    infra.insereAeroporto(aero3);
    infra.insereAeroporto(aero4);
  }

  @override
  Widget build(BuildContext context) {
    carregaAeroportos();
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
  AeroportosMock mock = AeroportosMock();
  late List<Aeroporto> aeroportos;
  late String cidade = '';
  late String estado = '';
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
    String e = '';
    String c = '';
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
                            aeroportos =
                                mock.infra.getAeroportoPorCidadeEstado(c, e);
                            print(aeroportos);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AeroportosScreen(
                                          aeroporto: aeroportos,
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
