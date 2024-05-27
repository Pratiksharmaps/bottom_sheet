import 'package:bottom_sheet/home.dart';
import 'package:bottom_sheet/provider/calender_provider.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarModalSheet extends ConsumerWidget {
  const CalendarModalSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final focusedDay = ref.watch(focusedDayProvider);

    return Container(
      height: 620,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Select a Date',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          Expanded(
            flex: 4,
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: focusedDay,
              selectedDayPredicate: (day) => isSameDay(selectedDate, day),
              onDaySelected: (selectedDay, focusedDay) {
                ref.read(selectedDateProvider.notifier).state = selectedDay;
                ref.read(focusedDayProvider.notifier).state = focusedDay;
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const HomePage())));
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Today Date: $focusedDay',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
