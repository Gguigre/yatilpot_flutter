import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:yatilpot_flutter/domain/entities/Event.dart';

abstract class GetEventUseCase<T> extends UseCase<GetEventUseCaseResponse, T> {}

class GetEventUseCaseResponse {
  Event event;
  GetEventUseCaseResponse(this.event);
}
