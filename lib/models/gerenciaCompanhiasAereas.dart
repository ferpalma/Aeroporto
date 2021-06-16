import './companhia.dart';

class GerenciaCompanhiasAereas {
  GerenciaCompanhiasAereas();
  List<Companhia> _vetCompanhia = [];
  List<Companhia> _vetHistoricoCompanhia = [];
  List<Companhia> get getCompanhias => _vetCompanhia;
  List<Companhia> get getHistoricoCompanhia => _vetHistoricoCompanhia;

  isEmpty() {
    if (getCompanhias.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  void insereCompanhia(Companhia novaCompanhia) {
    getCompanhias.add(novaCompanhia);
  }

  Companhia? getCompanhiaPorNome(String nome) {
    Companhia? comp;
    for (int i = 0; i < getCompanhias.length; i++) {
      if (getCompanhias[i].getNome == nome) {
        comp = getCompanhias[i];
      }
    }
    return comp;
  }

  salvarAntesDeletarCompanhia(String nome) {
    String variavel = "";
    for (int i = 0; i < getCompanhias.length; i++) {
      if (getCompanhias[i].getNome == nome) {
        getHistoricoCompanhia.add(getCompanhias[i]);
        getCompanhias.remove(getCompanhias[i]);
        variavel = "\n*** Companhia removida com sucesso ";
      } else {
        variavel = "\nNenhuma Companhia com esse nome foi encontrada";
      }
    }
    return variavel;
  }

  deletarCompanhia(String nome) {
    String variavel = "";
    for (int i = 0; i < getCompanhias.length; i++) {
      if (getCompanhias[i].getNome == nome) {
        getCompanhias.remove(getCompanhias[i]);
        print("\n Companhia removida com sucesso ");
        return variavel;
      } else {
        print("\nNenhuma companhia com esse nome foi encontrada");
        return variavel;
      }
    }
  }

  toStringCompanhiaPorNome(String nome) {
    String variavel = "";
    if (getCompanhias.length == 0) {
      variavel = "\nNenhuma companhia com esse nome foi encontrada";
    } else {
      for (int i = 0; i < getCompanhias.length; i++) {
        if (getCompanhias[i].getNome == nome) {
          variavel += getCompanhias[i].toString();
        }
      }
    }
    return variavel;
  }

  String toStringHistoricoCompanhia() {
    String variavel = "";
    if (getHistoricoCompanhia.length == 0) {
      variavel = "\nnão há companhias";
      return variavel;
    } else {
      for (int posicao = 0; posicao < getHistoricoCompanhia.length; posicao++) {
        variavel += getHistoricoCompanhia[posicao].toString();
      }
    }
    return variavel;
  }

  String toStringNomeCompanhias() {
    String variavel = "";
    if (getCompanhias.length == 0) {
      variavel = "\nnão há companhias";
      return variavel;
    } else {
      for (int posicao = 0; posicao < getCompanhias.length; posicao++) {
        variavel += "\n" + getCompanhias[posicao].getNome;
      }
    }
    return variavel;
  }

  String toStringCompanhias() {
    String variavel = "";
    if (getCompanhias.length == 0) {
      variavel = "\nnão há companhias";
      return variavel;
    } else {
      for (int posicao = 0; posicao < getCompanhias.length; posicao++) {
        variavel += getCompanhias[posicao].toString();
      }
    }
    return variavel;
  }
}
