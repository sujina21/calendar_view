import 'package:calendar/view/calender_time_app_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => const CalendarTimeApp()},
    ),
  );
}
