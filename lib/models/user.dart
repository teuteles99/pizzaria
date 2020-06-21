class User {
  String _nome;
  String _usuario;
  String _senha;
  String _cpf;
  String _email;
  String _celular;
  String _flaglogged;



  User(this._nome, this._usuario, this._senha, this._cpf, this._email, this._celular, this._flaglogged);

  User.map(dynamic obj) {
    this._nome = obj['nome'];
    this._usuario = obj['usuario'];
    this._senha = obj['senha'];
    this._cpf = obj['cpf'];
    this._email = obj['email'];
    this._celular = obj['celular'];
    this._flaglogged = obj['senha'];
  }

  String get nome => _nome;
  String get usuario => _usuario;
  String get senha => _senha;
  String get cpf => _cpf;
  String get email => _email;
  String get celular => _celular;
  String get flaglogged => _flaglogged;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["nome"] = _nome;
    map["usuario"] = _usuario;
    map["senha"] = _senha;
    map["cpf"] = _cpf;
    map["email"] = _email;
    map["celular"] = _celular;
    map["flaglogged"] = _flaglogged;
    return map;
  }
}
