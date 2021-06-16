import 'package:aeroinfraero/models/aeroporto.dart';
import 'package:aeroinfraero/models/voo.dart';
import 'package:flutter/material.dart';

class DetalhesVooScreen extends StatelessWidget {
  Voo? voo = Voo();
  late final Aeroporto? aeroporto;
  late final int? numero;
  DetalhesVooScreen({this.numero, this.aeroporto});

  void carregarDados() {
    voo = aeroporto!.getVoosPorNumero(numero!);
  }

  @override
  Widget build(BuildContext context) {
    carregarDados();
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes do Vôo")),
      body: SingleChildScrollView(
        child: Center(
          child: Expanded(
            child: Column(),
          ),
        ),
      ),
    );
    ;
  }
}
