class Schedule {
  bool isSelected;
  bool isMorning;
  bool isAfternoon;
  bool isEvening;
  String day;

  Schedule(
      {this.isSelected = false,
      this.day = 'MON',
      this.isMorning = false,
      this.isAfternoon = false,
      this.isEvening = false});
}
