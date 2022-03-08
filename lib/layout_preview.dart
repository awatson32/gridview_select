import 'package:flutter/material.dart';

class LayoutPreview extends StatelessWidget {
  final List<Widget> tiles;

  const LayoutPreview({Key? key, required this.tiles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.shade300, width: .75),
            borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: GridView.builder(
            padding: const EdgeInsets.all(0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: tiles.length >= 2 ? 2 : 1,
                mainAxisSpacing: 50,
                crossAxisSpacing: 50,
                childAspectRatio: 1.5),
            itemCount: tiles.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(child: tiles[index]);
            },
          ),
        ),
      ),
    );
  }
}
