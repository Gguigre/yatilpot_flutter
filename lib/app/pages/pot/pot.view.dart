import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yatilpot_flutter/app/pages/pot/pot.controller.dart';
import 'package:yatilpot_flutter/data/repositories/GoogleCalendarEventRepository.dart';

class PotPage extends View {
  @override
  // Dependencies can be injected here
  State<StatefulWidget> createState() => PotState();
}

class PotState extends ViewState<PotPage, PotController> {
  PotState() : super(PotController(GoogleCalendarEventRepository()));

  @override
  Widget get view => Container(child: Center(
        child: ControlledWidgetBuilder<PotController>(
            builder: (context, controller) {
          if (controller.loading) return CircularProgressIndicator();

          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(controller.logoAsset, height: 100),
                Text(
                  controller.answer,
                  textScaleFactor: 3,
                ),
                controller.status != PotStatus.no
                    ? Text(
                        controller.potDetails,
                        textScaleFactor: 2,
                        textAlign: TextAlign.center,
                      )
                    : null
              ].where((element) => element != null).toList());
        }),
      ));
}
