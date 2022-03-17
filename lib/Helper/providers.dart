import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weekly_schedular/Model/schedule.dart';
import 'package:weekly_schedular/ViewModel/scheduling_controller.dart';
import '../ViewModel/home_controller.dart';

final schedulingProvider = StateNotifierProvider<SchedulingController, List<Schedule>>((ref) {
  return SchedulingController();
});

final homeProvider = StateNotifierProvider<HomeController, List<Schedule>>((ref) {
  return HomeController();
});
