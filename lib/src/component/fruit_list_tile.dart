import 'package:flutter/material.dart';

class FruitListTile extends StatefulWidget {
  final String name;
  final String price;
  final String image;
  final color;
  void Function()? onPressed;

  FruitListTile(
      {required this.name,
      required this.price,
      required this.image,
      required this.color,
      required this.onPressed});

  @override
  State<FruitListTile> createState() => _FruitListTileState();
}

class _FruitListTileState extends State<FruitListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
          padding: EdgeInsets.all(10),
          color: widget.color[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 100, width: 150, child: Image.asset(widget.image)),
              Text(widget.name),
              ElevatedButton(
                onPressed: widget.onPressed,
                child: Text(
                  '\$' + widget.price,
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: widget.color[800]),
              ),
            ],
          )),
    );
  }
}
