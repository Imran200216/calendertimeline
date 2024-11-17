import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Set initial date to today.
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // Today's date
    DateTime today = DateTime.now();
    // 4 days from today
    DateTime lastHighlightDate = today.add(const Duration(days: 4));

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            CalendarTimeline(
              initialDate: selectedDate,
              firstDate: DateTime(2019, 1, 1),
              lastDate: DateTime(2028, 12, 31),
              onDateSelected: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
              leftMargin: 20,
              monthColor: Colors.blueGrey,
              dayColor: Colors.teal[200],
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Colors.redAccent[100],
              // Highlight specific days
              selectableDayPredicate: (date) {
                // Highlight only today and the next 4 days
                return date.isBefore(
                        lastHighlightDate.add(const Duration(days: 1))) &&
                    date.isAfter(today.subtract(const Duration(days: 1)));
              },
              locale: 'en_ISO',
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Selected Date: ${selectedDate.toLocal().toString().split(' ')[0]}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 500,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.zero,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
