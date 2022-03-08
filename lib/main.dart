import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gridview_example/layout_preview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(size: 40),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ListItem<T> {
  bool isSelected = false;
  T data;
  ListItem(this.data);
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> items = <Widget>[];

  int maxTiles = 4;
  int currentTiles = 0;

  void addTileToList(item) {
    setState(() {
      items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: LayoutPreview(
                tiles: items,
              ),
            ),
            Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 16),
                    primary: false,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 36),
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (currentTiles < maxTiles) {
                            addTileToList(categories[index].icon);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: Colors.blue.shade400)),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              categories[index].icon,
                              Center(
                                child: Text(categories[index].name,
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

final List<Category> categories = [
  Category(
      icon: FaIcon(FontAwesomeIcons.fileMedical), name: 'Full Patient Record'),
  Category(icon: FaIcon(FontAwesomeIcons.prescription), name: 'Medications'),
  Category(icon: FaIcon(FontAwesomeIcons.xRay), name: 'Imaging'),
  Category(icon: FaIcon(FontAwesomeIcons.vial), name: 'Lab Results'),
  Category(icon: FaIcon(FontAwesomeIcons.procedures), name: 'Procedures'),
  Category(icon: FaIcon(FontAwesomeIcons.solidFolder), name: 'Conditions'),
  Category(icon: FaIcon(FontAwesomeIcons.clipboardCheck), name: 'Checklist'),
  Category(
      icon: FaIcon(FontAwesomeIcons.bookMedical), name: 'Education Library'),
  Category(
      icon: FaIcon(FontAwesomeIcons.solidPlayCircle), name: 'Remote Display')
];

class Category {
  final FaIcon icon;
  final String name;
  final bool isSelected;

  const Category(
      {required this.icon, required this.name, this.isSelected = false});
}
