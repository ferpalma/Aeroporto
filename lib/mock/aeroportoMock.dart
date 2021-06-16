import 'package:aeroinfraero/models/aeroporto.dart';
import 'package:aeroinfraero/models/companhia.dart';
import 'package:aeroinfraero/models/gerenciaCompanhiasAereas.dart';
import 'package:aeroinfraero/models/infraeros.dart';
import 'package:aeroinfraero/models/voo.dart';

class AeroportosMock {
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

    // List<Aeroporto> aeroportos = [];
    // // Preenche dados Mokados
    //
    // void carregarAeroporto() {
    //   aeroportos.add(Aeroporto.with_parameters(
    //       'Santo Amaro', 'AB2235', 'São Paulo', 'SP', 'Brazil'));
    //   aeroportos.add(Aeroporto.with_parameters(
    //       'Congonhas', 'CD8956', 'São Paulo', 'SP', 'Brazil'));
    //   aeroportos.add(Aeroporto.with_parameters(
    //       'Galeão', 'NH1254', 'Rio de Janeiro', 'RJ', 'Brazil'));
    //   aeroportos.add(Aeroporto.with_parameters(
    //       'Salgado Filho', 'QA8525', 'Porto Alegre', 'RS', 'Brazl'));
    //   aeroportos.add(Aeroporto.with_parameters(
    //       'Vira Copos', 'OP9412', 'Campinas', 'SP', 'Brazil'));
    //   aeroportos.add(Aeroporto.with_parameters(
    //       'Santa Genoveva', 'SA8532', 'Goiânia', 'GO', 'Brazil'));
    // }
  }
}
