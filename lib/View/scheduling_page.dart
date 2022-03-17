import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weekly_schedular/Helper/strings.dart';
import '../Helper/providers.dart';
import 'home_page.dart';

class SchedulingPage extends ConsumerWidget {
  const SchedulingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var scheduleList = ref.watch(schedulingProvider);
    return Scaffold(
        appBar: AppBar(title: const Text('Scheduling Page')),
        body: Column(
          children: [
            const Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    Strings.titleText,
                    style:
                        TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              flex: 6,
              child: ListView.builder(
                  itemCount: scheduleList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: scheduleList[index].isSelected
                                  ? MaterialStateProperty.all(Colors.green)
                                  : MaterialStateProperty.all(Colors.grey),
                              value: true,
                              shape: const CircleBorder(),
                              onChanged: (bool? value) {
                                ref
                                    .read(schedulingProvider.notifier)
                                    .changeSelection(scheduleList[index]);
                              },
                            ),
                            Text(
                              scheduleList[index].day.substring(0, 3).toUpperCase(),
                              style:
                                  const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            Visibility(
                              visible: scheduleList[index].isSelected,
                              child: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      child: Text(
                                        'Morning',
                                        style: TextStyle(
                                            color: scheduleList[index].isMorning
                                                ? Colors.purple
                                                : Colors.grey),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(Colors.white),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  side: BorderSide(
                                                      color: scheduleList[index].isMorning
                                                          ? Colors.purple
                                                          : Colors.grey)))),
                                      onPressed: () {
                                        ref
                                            .read(schedulingProvider.notifier)
                                            .changeMorningAvailability(scheduleList[index]);
                                      },
                                    ),
                                    ElevatedButton(
                                      child: Text(
                                        'Afternoon',
                                        style: TextStyle(
                                            color: scheduleList[index].isAfternoon
                                                ? Colors.purple
                                                : Colors.grey),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(Colors.white),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  side: BorderSide(
                                                      color: scheduleList[index].isAfternoon
                                                          ? Colors.purple
                                                          : Colors.grey)))),
                                      onPressed: () {
                                        ref
                                            .read(schedulingProvider.notifier)
                                            .changeAfternoonAvailability(scheduleList[index]);
                                      },
                                    ),
                                    ElevatedButton(
                                      child: Text(
                                        'Evening',
                                        style: TextStyle(
                                            color: scheduleList[index].isEvening
                                                ? Colors.purple
                                                : Colors.grey),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(Colors.white),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  side: BorderSide(
                                                      color: scheduleList[index].isEvening
                                                          ? Colors.purple
                                                          : Colors.grey)))),
                                      onPressed: () {
                                        ref
                                            .read(schedulingProvider.notifier)
                                            .changeEveningAvailability(scheduleList[index]);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible: !scheduleList[index].isSelected,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const [
                                  SizedBox(width: 20),
                                  Text('Unavalable'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                        )
                      ],
                    );
                  }),
            ),
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: ElevatedButton(
                          onPressed: () {
                            ref.read(schedulingProvider.notifier).saveList(true);
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const HomePage()));
                          },
                          child: const Text('Save'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            primary: Colors.purple,
                            shape: const StadiumBorder(),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
