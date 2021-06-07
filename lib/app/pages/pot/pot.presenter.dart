import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:yatilpot_flutter/domain/repositories/EventRepository.dart';
import 'package:yatilpot_flutter/domain/usecases/GetCurrentEventUseCase.dart';
import 'package:yatilpot_flutter/domain/usecases/GetEventUseCase.dart';
import 'package:yatilpot_flutter/domain/usecases/GetNextEventUseCase.dart';

class PotPresenter extends Presenter {
  Function onCurrentPot;
  Function onNoCurrentPot;

  Function onNextPot;
  Function onNoNextPot;

  PotPresenter(EventRepository repository)
      : getCurrentEventUseCase = GetCurrentEventUseCase(repository),
        getNextEventUseCase = GetNextEventUseCase(repository);

  final GetNextEventUseCase getNextEventUseCase;
  final GetCurrentEventUseCase getCurrentEventUseCase;

  getCurrentPot() {
    getCurrentEventUseCase.execute(GetCurrentEventObserver(this));
  }

  getNextPot() {
    getNextEventUseCase.execute(GetNextEventObserver(this));
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

class GetCurrentEventObserver extends Observer<GetEventUseCaseResponse> {
  PotPresenter presenter;

  GetCurrentEventObserver(this.presenter);

  @override
  void onComplete() {
    // TODO: implement onComplete
  }

  @override
  void onError(e) {
    this.presenter.onNoCurrentPot();
  }

  @override
  void onNext(GetEventUseCaseResponse response) {
    this.presenter.onCurrentPot(response.event);
  }
}

class GetNextEventObserver extends Observer<GetEventUseCaseResponse> {
  PotPresenter presenter;

  GetNextEventObserver(this.presenter);

  @override
  void onComplete() {
    // TODO: implement onComplete
  }

  @override
  void onError(e) {
    this.presenter.onNoNextPot();
  }

  @override
  void onNext(GetEventUseCaseResponse response) {
    this.presenter.onNextPot(response.event);
  }
}
