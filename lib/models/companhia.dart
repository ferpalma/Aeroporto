class Companhia {
  late String _nome;
  late int _codigo;
  Companhia.with_parameters(this._nome, this._codigo);
  get getNome => _nome;
  setNome(String nome) => this._nome = nome;
  get getCodigo => _codigo;
  setCodigo(int codigo) => this._codigo = codigo;

  toString() {
    return "$_nome";
  }
}
