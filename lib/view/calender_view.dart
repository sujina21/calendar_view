import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  TimeOfDay? time = TimeOfDay.now();
  DateTime? date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar Screen'),
      ),
      body: Center(
        // Centers the content
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Vertically centered
            crossAxisAlignment:
                CrossAxisAlignment.center, // Horizontally centered
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centers the row's content horizontally
                children: [
                  Text(
                    'Time: ${time?.hour}:${time?.minute}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                      width: 10), // Adds space between the text and button
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                        context: context,
                        initialTime: time ?? TimeOfDay.now(),
                      );
                      if (newTime != null) {
                        setState(() {
                          time = newTime;
                        });
                      }
                    },
                    child: const Text('Change Time'),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Adds space between time and date
              Text(
                'Date: ${date?.day}/${date?.month}/${date?.year}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20), // Adds space between date and button
              ElevatedButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: date ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050),
                  );
                  if (newDate != null) {
                    setState(() {
                      date = newDate;
                    });
                  }
                },
                child: const Text('Change Date'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
