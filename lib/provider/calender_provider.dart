import 'package:riverpod/riverpod.dart';
final selectedDateProvider = StateProvider<DateTime?>((ref) => null);
final focusedDayProvider = StateProvider<DateTime>((ref) => DateTime.now());
