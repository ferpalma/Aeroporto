import 'package:aeroinfraero/models/aeroporto.dart';
import 'package:aeroinfraero/models/voo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetalhesVooScreen extends StatelessWidget {
  late Voo voo = Voo();
  //late Aeroporto aeroporto;
  late int numero;
  DetalhesVooScreen({required this.numero, required this.voo});

  // void carregarDados() {
  //   voo = aeroporto.getVoosPorNumero(this.numero);
  // }

  @override
  Widget build(BuildContext context) {
    //carregarDados();
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes do Vôo")),
      body: SingleChildScrollView(
        child: Center(
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Text(
                        "Voo" + ": " + voo.getNumeroVoo.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Destino" + ": " + voo.getDestino,
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "Data" + ": " + voo.getData,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "Horário" + ": " + voo.getHorario,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "Companhia" + ": " + voo.getCompanhia.toString(),
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
