import 'dart:async';

import 'package:yatilpot_flutter/domain/entities/Event.dart';
import 'package:yatilpot_flutter/domain/repositories/EventRepository.dart';
import 'package:yatilpot_flutter/domain/usecases/GetEventUseCase.dart';

class GetCurrentEventUseCase extends GetEventUseCase<Null> {
  EventRepository repository;

  GetCurrentEventUseCase(this.repository);

  @override
  Future<Stream<GetEventUseCaseResponse>> buildUseCaseStream(
      Null params) async {
    final StreamController<GetEventUseCaseResponse> controller =
        StreamController();
    try {
      DateTime start = DateTime.now().subtract(Duration(days: 2));
      DateTime end = DateTime.now().add(Duration(days: 2));

      List<Event> events =
          await repository.getEvents(startTime: start, endTime: end);
      events.sort();
      DateTime now = DateTime.now();

      Event nextEvent = events.firstWhere(
          (event) => event.start.isBefore(now) && event.end.isAfter(now));

      controller.add(GetEventUseCaseResponse(nextEvent));
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}
