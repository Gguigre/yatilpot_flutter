import 'package:yatilpot_flutter/domain/entities/Event.dart';

abstract class EventRepository {
  Future<List<Event>> getEvents({DateTime startTime, DateTime endTime});
  Future<Event> getEvent(String eventId);
  Future<bool> isEventInProgress();
}
