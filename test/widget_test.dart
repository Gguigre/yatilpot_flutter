// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yatilpot_flutter/data/repositories/GoogleCalendarEventRepository.dart';
import 'package:yatilpot_flutter/domain/entities/Event.dart';
import 'package:yatilpot_flutter/domain/repositories/EventRepository.dart';
import 'package:yatilpot_flutter/domain/usecases/GetEventUseCase.dart';
import 'package:yatilpot_flutter/domain/usecases/GetNextEventUseCase.dart';

void main() {
  test('Google calendar event repo', () async {
    EventRepository repo = GoogleCalendarEventRepository();
    DateTime start = DateTime.now().subtract(Duration(days: 2));
    DateTime end = DateTime.now().add(Duration(days: 2));
    List<Event> events = await repo.getEvents(startTime: start, endTime: end);
    print("events : " + events.toString());
  });

  test('getNextEventUseCase', () async {
    EventRepository repo = GoogleCalendarEventRepository();
    GetNextEventUseCase useCase = GetNextEventUseCase(repo);

    useCase.execute(_GetNextEventObserver());
  });
}

class _GetNextEventObserver extends Observer<GetEventUseCaseResponse> {
  @override
  void onComplete() {
    print("_GetNextEventObserver onComplete");
  }

  @override
  void onError(e) {
    print("_GetNextEventObserver Error " + e.toString());
  }

  @override
  void onNext(GetEventUseCaseResponse response) {
    print("_GetNextEventObserver :" + response.event.toString());
  }
}
