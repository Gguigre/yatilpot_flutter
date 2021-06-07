import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {
  const Instructions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              "Bienvenue dans yatilpot !",
              textScaleFactor: 3,
              textAlign: TextAlign.center,
            ),
            margin: EdgeInsets.all(20),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Pour créer un pot, ajouter un évènement dans le calenderier de yatilpot.bam@gmail.com",
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Pour toute question, contacter Guillaumeg sur slack. Les PRs sont bien sûr les bienvenues sur le github !",
                    textAlign: TextAlign.left,
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
