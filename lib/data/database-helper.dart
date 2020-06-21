import 'dart:io';
import 'package:flutter_sqlite/models/user.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _pizzaria;
  final String tableTbUsuario = "TbUsuario";
  final String columnNome = "nome";
  final String columnUsuario = "usuario";
  final String columnSenha = "senha";
  final String columnCpf = "cpf";
  final String columnEmail = "email";
  final String columnCelular = "celular";

  Future<Database> get pizzaria async {
    if (_pizzaria != null) {
      return _pizzaria;
    }
    _pizzaria = await initDb();
    return _pizzaria;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.pizzaria");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database pizzaria, int version) async {
    await pizzaria.execute(
        "CREATE TABLE TbUsuario(id INTEGER PRIMARY KEY, nome TEXT, usuario TEXT, senha TEXT, cpf TEXT, email TEXT, celular TEXT, flaglogged TEXT)");
    print("Tabela Criada");
  }

  //insertion
  Future<int> saveUser(User user) async {
    var dbClient = await pizzaria;
    print(user.nome);
    int res = await dbClient.insert("TbUsuario", user.toMap());
    List<Map> list = await dbClient.rawQuery('SELECT * FROM TbUsuario');
    print(list);
    return res;
  }

  //deletion
  Future<int> deleteUser(User user) async {
    var dbClient = await pizzaria;
    int res = await dbClient.delete("TbUsuario");
    return res;
  }
  Future<User> selectUser(User user) async{
    print("Select TbUsuario");
    print(user.usuario);
    print(user.senha);
    var dbClient = await pizzaria;
    List<Map> maps = await dbClient.query(tableTbUsuario,
        columns: [columnUsuario, columnSenha],
        where: "$columnUsuario = ? and $columnSenha = ?",
        whereArgs: [user.usuario,user.senha]);
    print(maps);
    if (maps.length > 0) {
      print("Usuario Existe !!!");
      return user;
    }else {
      return null;
    }
  }
}
