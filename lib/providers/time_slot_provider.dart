import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeSlotProvider = StateNotifierProvider<TimeSlotNotifier, int?>((ref) {
  return TimeSlotNotifier();
});

class TimeSlotNotifier extends StateNotifier<int?> {
  TimeSlotNotifier() : super(null);

  void selectTimeSlot(int index) {
    state = index;
  }

  void clearSelection() {
    state = null;
  }
}
