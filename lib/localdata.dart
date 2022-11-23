import 'package:exammm3/model/sql_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();
  static Database? _database;

  factory LocalDatabase() {
    return getInstance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("third_exam.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  LocalDatabase._init();

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''
    CREATE TABLE $productsTable (
    ${SqlProdfield.id} $idType,
    ${SqlProdfield.count} $intType,
    ${SqlProdfield.productId} $intType,
    ${SqlProdfield.imageUrl} $textType,
    ${SqlProdfield.name} $textType,
    ${SqlProdfield.price} $intType
    )
    ''');

  }

  static Future<SqlSelectedProduct> insertProduct(SqlSelectedProduct cachedProduct) async {
    final db = await getInstance.database;
    final id = await db.insert(productsTable, cachedProduct.toJson());
    return cachedProduct.copyWith(id: id);
  }

  static Future<List<SqlSelectedProduct>> getAllProducts() async {
    final db = await getInstance.database;
    const orderBy = "${SqlProdfield.name} ASC";
    final result = await db.query(
      productsTable,
      orderBy: orderBy,
    );
    return result.map((json) => SqlSelectedProduct.fromJson(json)).toList();
  }

  static Future<int> deleteAllProducts() async {
    final db = await getInstance.database;
    return await db.delete(productsTable);
  }

  static Future<int> deleteProductById(int id) async {
    final db = await getInstance.database;
    var t = await db.delete(productsTable, where: "${SqlProdfield.id}=?", whereArgs: [id]);
    if (t > 0) {
      return t;
    } else {
      return -1;
    }
  }

  static Future<int> updateProduct({required int id, required SqlSelectedProduct cachedProduct}) async {
    Map<String, dynamic> row = {
      SqlProdfield.name: cachedProduct.name,
      SqlProdfield.price: cachedProduct.price,
      SqlProdfield.count: cachedProduct.count,
      SqlProdfield.productId: cachedProduct.productId,
      SqlProdfield.imageUrl: cachedProduct.imageUrl,
    };
    final db = await getInstance.database;
    return db.update(
      productsTable,
      row,
      where: '${SqlProdfield.id} = ?',
      whereArgs: [id],
    );
  }

  static Future<int> updateProductCount({required int id, required int count}) async {
    Map<String, dynamic> row = {
      SqlProdfield.count: count,
    };
    final db = await getInstance.database;
    return db.update(
      productsTable,
      row,
      where: '${SqlProdfield.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await getInstance.database;
    db.close();
  }
}