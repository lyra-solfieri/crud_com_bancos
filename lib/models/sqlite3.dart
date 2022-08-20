
import 'package:sqflite/sqflite.dart';
import 'package:crud_com_bancos_diferentes/models/avioes.dart';


const String tableAviao = 'aviao';
const String aviaoId = '_id';
const String aviaoNome = 'nome';
const String aviaoAno = 'ano';
const String aviaoPais = 'pais';

class SqliteOperacao {

  
  late Database db;
  late Future<AviaoModel> avioes;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      create table $tableAviao ( 
        $aviaoId integer primary key autoincrement, 
        $aviaoNome text not null,
        $aviaoAno text not null),
        $aviaoPais text not null)
      ''');
    });
  }

  Future<AviaoModel> insert(AviaoModel aviao) async {
    aviao.nome = (await db.insert(tableAviao, aviao.toMap())) as String;
    return aviao;
  }



  Future<AviaoModel?> getAviao(int id) async {
    List<Map> maps = await db.query(tableAviao,
        columns: [aviaoNome, aviaoAno, aviaoNome],
        where: '$aviaoId = ?',
        whereArgs: [id]);
        return null;
    /*if (maps.length > 0) {
      return AviaoModel.fromMap(maps.first);
    }
    return null;*/
  }

  

  Future<int> delete(int id) async {
    return await db.delete(tableAviao, where: '$aviaoId = ?', whereArgs: [id]);
  }

  Future<int> update(AviaoModel aviao) async {
    return await db.update(tableAviao, aviao.toMap(),
        where: '$aviaoId = ?', whereArgs: [aviao.nome]);
  }

  Future close() async => db.close();
}