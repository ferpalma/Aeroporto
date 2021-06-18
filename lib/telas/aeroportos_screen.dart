import 'package:aeroinfraero/mock/aeroportoMock.dart';
import 'package:aeroinfraero/models/aeroporto.dart';
import 'package:aeroinfraero/telas/voos_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AeroportosScreen extends StatelessWidget {
  AeroportosMock mock = AeroportosMock();
  late List<Aeroporto> aeroporto;
  late String cidade;
  late String estado;

  AeroportosScreen(
      {Key? key,
      required this.cidade,
      required this.estado,
      required this.aeroporto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this.aeroporto);
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
                        fontSize: dw * 4,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 100)),
                    Text(
                      'ESTADO: $estado',
                      style: TextStyle(
                        fontSize: dw * 4,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: aeroporto.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(aeroporto[index].getNome),
                      subtitle: Text(aeroporto[index].getPais),
                      onTap: () {
                        print('Aeroportos $index selecionada');
                        //dar pushNemed para próxima tela

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VoosScreen(
                                      aeroporto: aeroporto[index],
                                    )));
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
