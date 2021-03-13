import 'package:flutter/material.dart';

class MenuButtonWidget {
  static final buttonsList = [
    MenuButtonWidget.create(text: 'teste1'),
    MenuButtonWidget.create(text: 'teste2'),
    MenuButtonWidget.create(text: 'teste3'),
    MenuButtonWidget.create(text: 'teste1'),
    MenuButtonWidget.create(text: 'teste2'),
    MenuButtonWidget.create(text: 'teste3'),
    MenuButtonWidget.create(text: 'teste1'),
    MenuButtonWidget.create(text: 'teste2'),
    MenuButtonWidget.create(text: 'teste3'),
    MenuButtonWidget.create(text: 'teste1'),
    MenuButtonWidget.create(text: 'teste2'),
    MenuButtonWidget.create(text: 'teste3'),
  ];

  MenuButtonWidget();

  static Color getButtonColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.purpleAccent[400];
    }
    return Colors.purple;
  }

  static TextStyle getTextColor(_) => TextStyle(color: Colors.white);

  static Widget create({String text}) => Container(
        height: 200,
        width: 200,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(text),
          style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor:
                MaterialStateColor.resolveWith(MenuButtonWidget.getButtonColor),
            textStyle: MaterialStateProperty.resolveWith(
                MenuButtonWidget.getTextColor),
          ),
        ),
      );
}
