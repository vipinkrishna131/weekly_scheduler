import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weekly_schedular/View/scheduling_page.dart';
import '../Helper/providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var scheduleList = ref.watch(schedulingProvider.notifier).scheduleList;
    var status = ref.watch(schedulingProvider.notifier).isSaved;
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page'), automaticallyImplyLeading: false),
      body: Column(
        children: [
          Flexible(
            flex: 8,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                ref.read(homeProvider.notifier).loadText(scheduleList, status),
                style:
                    const TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Center(
                child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(schedulingProvider.notifier).saveList(false);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SchedulingPage()),
                    );
                  },
                  child: Text(ref.read(homeProvider.notifier).checkSchedule(scheduleList, status)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    primary: Colors.purple,
                    shape: const StadiumBorder(),
                  ),
                ),
              ),
            )),
          )
        ],
      ),
    );
  }
}
