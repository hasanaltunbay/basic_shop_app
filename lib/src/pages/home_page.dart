import 'package:flutter/material.dart';
import 'package:flutter_application_6/src/model/fruit_list_model.dart';
import 'package:flutter_application_6/src/component/fruit_list_tile.dart';
import 'package:flutter_application_6/src/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text("Good Morning,"),
              SizedBox(
                height: 20,
              ),
              Text(
                "Let's order fresh items for you",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Divider(
                height: 10,
              ),
              SizedBox(
                height: 30,
              ),
              Text("Fresh Items"),
              SizedBox(
                height: 30,
              ),
              Expanded(child:
                  Consumer<FruitListModel>(builder: (context, value, child) {
                return GridView.builder(
                    itemCount: value.fruitList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1 / 1.2, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return FruitListTile(
                        name: value.fruitList[index][0],
                        price: value.fruitList[index][1],
                        image: value.fruitList[index][2],
                        color: value.fruitList[index][3],
                        onPressed: () {
                          Provider.of<FruitListModel>(context, listen: false)
                              .addCard(index);
                        },
                      );
                    });
              })),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
    );
  }
}
