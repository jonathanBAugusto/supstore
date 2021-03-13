import 'package:flutter/material.dart';
import 'package:supstore/widget/menu_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      print(constrains);
      return Center(
        child: Padding(
          child: getList(),
          padding: EdgeInsets.symmetric(
            vertical: 120,
            horizontal: 60,
          ),
        ),
      );
    });
  }

  Widget getRows(int colsNumber) {
    int count = 0;
    var btns = List<Widget>();
    var rows = List<Widget>();
    for (var btn in MenuButtonWidget.buttonsList) {
      if (count++ < colsNumber) {
        btns.add(btn);
      }

      if (count == colsNumber) {
        count = 0;
        rows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: btns,
          ),
        );
        btns = [];
      }

      if (MenuButtonWidget.buttonsList.last == btn) {
        rows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: btns,
          ),
        );
      }
    }
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 10),
      shrinkWrap: true,
      itemCount: rows.length,
      itemBuilder: (context, i) => rows[i],
    );
  }

  Widget getGrid(int colsNumber) {
    return GridView.extent(
      children: MenuButtonWidget.buttonsList,
      shrinkWrap: true,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      maxCrossAxisExtent: 180,
      cacheExtent: 180,
    );
  }

  Widget getList() {
    return SingleChildScrollView(
      child: Wrap(
        alignment: WrapAlignment.center,
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: List.generate(
          MenuButtonWidget.buttonsList.length,
          (index) => MenuButtonWidget.buttonsList[index],
        ),
      ),
    );
  }
}
