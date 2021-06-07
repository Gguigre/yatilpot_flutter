import 'package:dio/dio.dart';
import 'package:yatilpot_flutter/data/constants.dart';
import 'package:yatilpot_flutter/data/models/EventModel.dart';
import 'package:yatilpot_flutter/domain/entities/Event.dart';
import 'package:yatilpot_flutter/domain/repositories/EventRepository.dart';

class GoogleCalendarEventRepository extends EventRepository {
  @override
  Future<List<Event>> getEvents({DateTime startTime, DateTime endTime}) async {
    String formattedStartTime = formatDateTime(startTime);
    String formattedEndTime = formatDateTime(endTime);
    String queryUrl = GOOGLE_CALENDAR_API_URL + CALENDAR_ID + "/events";
    try {
      Response response = await Dio().get(queryUrl, queryParameters: {
        'key': GOOGLE_API_KEY,
        'timeMin': formattedStartTime,
        'timeMax': formattedEndTime
      });

      List<dynamic> events = response.data["items"];
      List<Event> result = events
          .map((event) => EventModel.fromGoogleCalendarData(event))
          .toList();
      return result;
    } catch (e) {
      print("Error while fetching events : " + e.toString());
    }
  }

  String formatDateTime(DateTime dateTime) {
    return dateTime
        .subtract(Duration(microseconds: dateTime.microsecond))
        .toUtc()
        .toIso8601String();
  }

  @override
  Future<Event> getEvent(String eventId) {
    // TODO: implement getEvent
    throw UnimplementedError();
  }

  @override
  Future<bool> isEventInProgress() {
    // TODO: implement isEventInProgress
    throw UnimplementedError();
  }
}
