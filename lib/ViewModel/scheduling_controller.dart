import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weekly_schedular/Model/schedule.dart';
import 'package:weekly_schedular/Repository/schedule_repository.dart';

class SchedulingController extends StateNotifier<List<Schedule>> {
  var scheduleList = <Schedule>[];
  bool isSaved = false;

  SchedulingController() : super([]) {
    fetchScheduleList();
    state = [...scheduleList];
  }

  void fetchScheduleList() {
    scheduleList = ScheduleRepository.fetchSchedules();
  }

  void changeSelection(Schedule schedule) {
    schedule.isSelected = !schedule.isSelected;
    state = [...scheduleList];
  }

  void changeMorningAvailability(Schedule schedule) {
    schedule.isMorning = !schedule.isMorning;
    state = [...scheduleList];
  }

  void changeAfternoonAvailability(Schedule schedule) {
    schedule.isAfternoon = !schedule.isAfternoon;
    state = [...scheduleList];
  }

  void changeEveningAvailability(Schedule schedule) {
    schedule.isEvening = !schedule.isEvening;
    state = [...scheduleList];
  }

  void saveList(bool status) {
    isSaved = status;
  }
}
