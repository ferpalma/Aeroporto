import 'package:aeroinfraero/models/aeroporto.dart';
import 'package:aeroinfraero/telas/DetalhesVoo_Screen.dart';
import 'package:flutter/material.dart';

class VoosScreen extends StatelessWidget {
  //AeroportosMock mock = AeroportosMock();
  final Aeroporto? aeroporto;
  VoosScreen({Key? key, this.aeroporto}) : super(key: key);
  //late List<Voo?> voos = mock.infra.getVooPorAeroporto(aeroporto);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Vôos'),
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: aeroporto!.getVoos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(aeroporto!.getVoos[index].getNumeroVoo),
                        subtitle: Text('Destino: ' +
                            aeroporto!.getVoos[index].getDestino +
                            aeroporto!.getVoos[index].getData +
                            '/' +
                            aeroporto!.getVoos[index].getHorario),
                        onTap: () {
                          print('Aeroportos $index selecionada');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetalhesVooScreen(
                                      numero: aeroporto!
                                          .getVoos[index].getNumeroVoo,
                                      aeroporto: aeroporto!.getNome[index])));
                        });
                  })
            ],
          ),
        ));
  }
}
