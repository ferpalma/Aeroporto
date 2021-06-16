import 'package:aeroinfraero/mock/aeroportoMock.dart';
import 'package:aeroinfraero/models/aeroporto.dart';
import 'package:aeroinfraero/telas/voos_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AeroportosScreen extends StatelessWidget {
  AeroportosMock mock = AeroportosMock();
  late String? cidade;
  late String? estado;

  AeroportosScreen({Key? key, this.cidade, this.estado}) : super(key: key);
  late List<Aeroporto?> aeroportos =
      mock.infra.getAeroportoPorCidadeEstado(cidade, estado);
  @override
  Widget build(BuildContext context) {
    //mock.carregaAeroportos();

    final dw = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      appBar: AppBar(
        title: Text('Aeroportos'),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      'CIDADE: $cidade',
                      style: TextStyle(
                        fontSize: dw * 3,
                        color: Colors.blue,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 100)),
                    Text(
                      'ESTADO: $estado',
                      style: TextStyle(
                        fontSize: dw * 3,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: aeroportos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(aeroportos[index]!.getNome),
                          subtitle: Text(aeroportos[index]!.getPais),
                          onTap: () {
                            print('Aeroportos $index selecionada');
                            //dar pushNemed para próxima tela

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VoosScreen(
                                          aeroporto: aeroportos[index]!.getNome,
                                        )));
                          },
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
