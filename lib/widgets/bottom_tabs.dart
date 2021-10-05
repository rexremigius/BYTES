// ignore: unused_import
import 'package:bytes/constant.dart';
import 'package:flutter/material.dart';

class BottomTab extends StatefulWidget {
  final int? selectedTab;
  final Function(int) tabPressed;
  BottomTab({this.selectedTab, required this.tabPressed});

  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab ?? 0;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomTabBtn(
            imagePath: "lib/assets/outline_home_black_20.png",
            selected: _selectedTab == 0 ? true : false,
            onPressed: () {
              setState(() {
                widget.tabPressed(0);
              });
            },
          ),
          BottomTabBtn(
            imagePath: "lib/assets/outline_search_black_20.png",
            selected: _selectedTab == 1 ? true : false,
            onPressed: () {
              setState(() {
               widget.tabPressed(1);
              });
            },
          ),
          BottomTabBtn(
            imagePath: "lib/assets/outline_shopping_cart_black_20.png",
            selected: _selectedTab == 2 ? true : false,
            onPressed: () {
              setState(() {
                widget.tabPressed(2);
              });
            },
          ),
          BottomTabBtn(
            imagePath: "lib/assets/outline_person_black_20.png",
            selected: _selectedTab == 3 ? true : false,
            onPressed: () {
              setState(() {
                widget.tabPressed(3);
              });
            },
          ),
        ],
      ),
    );
  }
}

class BottomTabBtn extends StatelessWidget {
  final String? imagePath;
  final bool? selected;
  final VoidCallback? onPressed;
  BottomTabBtn({this.imagePath, this.selected, this.onPressed});
  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          // decoration: BoxDecoration(
          //   // border: Border(
          //   //   top: BorderSide(
          //   //     color:_selected ? Theme.of(context).accentColor : Colors.transparent,
          //   //     width: 2.0,
          //   //   ),
          //   )
          // ),
          child: Image(
            image: AssetImage(
              imagePath ?? "lib/assets/outline_home_black_20.png",
            ),
            width: 36.0,
            height: 36.0,
            color: _selected ? Theme.of(context).accentColor : Colors.black,
          ),
        ));
  }
}
