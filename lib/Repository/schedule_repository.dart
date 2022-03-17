import 'package:weekly_schedular/Model/schedule.dart';

class ScheduleRepository {
  static List<Schedule> fetchSchedules() {
    var scheduleList = <Schedule>[];

    scheduleList = [
      Schedule(
          isSelected: false, day: 'Sunday', isMorning: false, isAfternoon: false, isEvening: false),
      Schedule(
          isSelected: false, day: 'Monday', isMorning: false, isAfternoon: false, isEvening: false),
      Schedule(
          isSelected: false,
          day: 'Tuesday',
          isMorning: false,
          isAfternoon: false,
          isEvening: false),
      Schedule(
          isSelected: false,
          day: 'Wednesday',
          isMorning: false,
          isAfternoon: false,
          isEvening: false),
      Schedule(
          isSelected: false,
          day: 'Thursday',
          isMorning: false,
          isAfternoon: false,
          isEvening: false),
      Schedule(
          isSelected: false, day: 'Friday', isMorning: false, isAfternoon: false, isEvening: false),
      Schedule(
          isSelected: false,
          day: 'Saturday',
          isMorning: false,
          isAfternoon: false,
          isEvening: false),
    ];

    return scheduleList;
  }
}
