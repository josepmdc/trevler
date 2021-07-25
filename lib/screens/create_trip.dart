import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateTripPage extends StatelessWidget {
  Future<DateTime> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    print(picked?.toIso8601String());
    return picked ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Container(
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Origin',
                      hintStyle: TextStyle(color: Colors.black45),
                    ),
                  ),
                  TextFormField(
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Destination',
                      hintStyle: TextStyle(color: Colors.black45),
                    ),
                  ),
                  TextFormField(
                    maxLines: 1,
                    onTap: () => _selectDate(context),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Departure Date',
                      hintStyle: TextStyle(color: Colors.black45),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
