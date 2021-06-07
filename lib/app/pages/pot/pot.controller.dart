import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:yatilpot_flutter/app/pages/pot/pot.presenter.dart';
import 'package:yatilpot_flutter/domain/entities/Event.dart';
import 'package:yatilpot_flutter/domain/repositories/EventRepository.dart';

class PotController extends Controller {
  AnimationController animationController;
  Animation<double> _animation;
  final PotPresenter presenter;
  PotStatus status;
  String potName;
  String potLocation;
  String logoAsset;
  String answer;
  bool loading;
  String potDetails;

  PotController(EventRepository repository)
      : presenter = PotPresenter(repository),
        status = PotStatus.no,
        loading = true,
        logoAsset = "assets/beer.svg",
        answer = "",
        potDetails = "";

  @override
  void onInitState() {
    print("Init");
    presenter.getCurrentPot();
    super.onInitState();
  }

  @override
  void initListeners() {
    presenter.onCurrentPot = this.onCurrentPot;
    presenter.onNoCurrentPot = this.onNoCurrentPot;
    presenter.onNextPot = this.onNextPot;
    presenter.onNoNextPot = this.onNoNextPot;
  }

  onCurrentPot(Event pot) {
    print("CurrentPot");
    loading = false;
    this.status = PotStatus.currently;
    logoAsset = "assets/beer.svg";
    answer = "Oui bien sûr !";
    potDetails = "Il y a ${pot.name}";
    if (pot.location != null) {
      potDetails += "\n${pot.location}";
    }

    refreshUI();
  }

  onNoCurrentPot() {
    print("NoCurrentPot");
    presenter.getNextPot();
  }

  onNextPot(Event pot) {
    print("NextPot");
    switch (this.status) {
      case PotStatus.currently:
      case PotStatus.almost:
        this.status = PotStatus.no;
        presenter.getCurrentPot();
        break;
      case PotStatus.no:
        this.status = PotStatus.almost;
        logoAsset = "assets/beer.svg";
        answer = "Presque !";
        potDetails = "Il y a ${pot.name}";
        pot.start.difference(DateTime.now());
        if (pot.location != null) {
          potDetails += "\n${pot.location}";
        }
        loading = false;
        refreshUI();
        break;
    }
  }

  onNoNextPot() {
    print("NoNextPot");
    this.status = PotStatus.no;
    logoAsset = "assets/sad.svg";
    answer = "Non...";
    loading = false;
    refreshUI();
  }
}

enum PotStatus { currently, almost, no }
