import 'package:bottom_sheet/provider/calender_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selected Date",
        style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.blue,
       
      ),
      body: Center(
        child: Text(
          'Selected Date: ${selectedDate?.toLocal()}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
