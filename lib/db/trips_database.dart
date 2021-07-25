import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:trevler/models/trip.dart';

class TripsDatabase {
  static final TripsDatabase instance = TripsDatabase._init();

  static Database? _database;

  TripsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('trips.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    String dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE $tripsTable(
        ${TripFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${TripFields.date} TEXT NOT NULL,
        ${TripFields.origin} TEXT NOT NULL,
        ${TripFields.destination} TEXT NOT NULL,
        ${TripFields.image} TEXT
      )''',
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<Trip> create(Trip trip) async {
    final db = await instance.database;
    final id = await db.insert(tripsTable, trip.toMap());
    return trip.copy(id: id);
  }

  Future<Trip> read(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tripsTable,
      columns: TripFields.values,
      where: '${TripFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Trip.fromMap(maps.first);
    }
    throw Exception('ID $id not found');
  }

  Future<List<Trip>> readAllTrips() async {
    final db = await instance.database;
    final result = await db.query(
      tripsTable,
      orderBy: '${TripFields.date} DESC',
    );
    return result.map((map) => Trip.fromMap(map)).toList();
  }

  Future<int> update(Trip trip) async {
    final db = await instance.database;
    return db.update(
      tripsTable,
      trip.toMap(),
      where: '${TripFields.id} = ?',
      whereArgs: [trip.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tripsTable,
      where: '${TripFields.id} = ?',
      whereArgs: [id],
    );
  }
}
