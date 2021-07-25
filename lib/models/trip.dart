final String tripsTable = 'trips';

class TripFields {
  static final String id = '_id';
  static final String date = 'date';
  static final String origin = 'origin';
  static final String destination = 'destination';
  static final String image = 'image';
  static final List<String> values = [id, origin, destination, image];
}

class Trip {
  final int id;
  final DateTime date;
  final String origin;
  final String destination;
  final String image;

  Trip({
    required this.id,
    required this.date,
    required this.origin,
    required this.destination,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      TripFields.id: id,
      TripFields.date: date.toIso8601String(),
      TripFields.origin: origin,
      TripFields.destination: destination,
      TripFields.image: image,
    };
  }

  Trip.fromMap(Map<String, dynamic> trip)
      : id = trip[TripFields.id] as int,
        date = DateTime.parse(trip[TripFields.date] as String),
        origin = trip[TripFields.origin] as String,
        destination = trip[TripFields.destination] as String,
        image = trip[TripFields.image] as String;

  @override
  String toString() {
    return 'Trip{id: $id, date: {$date.toIso8601String()} , origin: $origin, destination: $destination, image: $image}';
  }

  Trip copy(
          {int? id,
          DateTime? date,
          String? origin,
          String? destination,
          String? image}) =>
      Trip(
        id: id ?? this.id,
        date: date ?? this.date,
        origin: origin ?? this.origin,
        destination: destination ?? this.destination,
        image: image ?? this.image,
      );
}
