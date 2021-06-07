import 'package:yatilpot_flutter/domain/entities/Event.dart';

class EventModel extends Event {
  EventModel(String name, String location, DateTime start, DateTime end)
      : super(name, location, start, end);

  factory EventModel.fromGoogleCalendarData(Map<String, dynamic> json) {
    return EventModel(
        json["summary"],
        json["location"],
        DateTime.parse(json["start"]["dateTime"]),
        DateTime.parse(json["end"]["dateTime"]));
  }
}
