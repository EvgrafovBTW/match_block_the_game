import 'package:flutter/material.dart';

class GameCell extends StatefulWidget {
  final Color cellColor;
  final bool isCellActive;
  const GameCell(
      {Key? key, required this.cellColor, required this.isCellActive})
      : super(key: key);

  @override
  State<GameCell> createState() => _GameCellState();
}

class _GameCellState extends State<GameCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: widget.isCellActive ? widget.cellColor : Colors.white,
          border: Border.all(width: 1)),
    );
  }
}
