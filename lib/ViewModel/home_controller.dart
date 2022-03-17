import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weekly_schedular/Model/schedule.dart';
import '../Helper/strings.dart';

class HomeController extends StateNotifier<List<Schedule>> {
  var scheduleList = <Schedule>[];
  String scheduleText = '';
  HomeController() : super([]);

  String loadText(List<Schedule> scheduleList, bool status) {
    var availableList = scheduleList
        .where((e) => e.isSelected && (e.isMorning || e.isAfternoon || e.isEvening))
        .toList();
    scheduleText = Strings.initialText;
    if (availableList.isNotEmpty && status) {
      for (int i = 0; i < availableList.length; i++) {
        if ((i > 0) && (i == (availableList.length - 1))) {
          scheduleText = scheduleText + ' and ';
        } else if (i > 0) {
          scheduleText = scheduleText + ',';
        }

        scheduleText = scheduleText + availableList[i].day;
        if (availableList[i].isMorning &&
            availableList[i].isAfternoon &&
            availableList[i].isEvening) {
          scheduleText = scheduleText + Strings.wholeDay;
        } else {
          if (availableList[i].isMorning) {
            scheduleText = scheduleText + Strings.morning;
          }
          if (availableList[i].isAfternoon) {
            scheduleText = scheduleText + Strings.afternoon;
          }
          if (availableList[i].isEvening) {
            scheduleText = scheduleText + Strings.evening;
          }
        }
      }
      return scheduleText;
    } else {
      return Strings.noSchedule;
    }
  }

  String checkSchedule(List<Schedule> scheduleList, bool status) {
    var list =
        scheduleList.where((e) => e.isSelected && (e.isMorning || e.isAfternoon || e.isEvening));
    if (list.isNotEmpty && status) {
      return Strings.edit;
    } else {
      return Strings.add;
    }
  }
}
