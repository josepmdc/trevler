import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trevler/models/trip.dart';
import 'package:trevler/screens/create_trip.dart';

class TripsCarousel extends StatelessWidget {
  final List<Trip> trips = [
    Trip(
      id: 1,
      date: DateTime(2022),
      origin: 'Barcelona',
      destination: 'Nepal',
      image:
          'https://images.unsplash.com/photo-1617380613434-7495e9b45dfb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    ),
  ];

  @override
  Widget build(BuildContext context) => Container(
        height: 200,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 16, right: 6),
            itemCount: trips.length + 1,
            itemBuilder: (context, index) => Container(
                  width: 250,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateTripPage(),
                      ),
                    ),
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(getImage(index)),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                index == trips.length
                                    ? 'Add a new trip'
                                    : trips[index].destination,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
      );

  String getImage(int index) => index == trips.length
      ? 'https://images.unsplash.com/photo-1623057000049-e220f79c7051?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=907&q=80'
      : trips[index].image;
}
