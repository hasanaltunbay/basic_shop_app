import 'package:flutter/material.dart';
import 'package:flutter_application_6/src/model/fruit_list_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart Page",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Consumer<FruitListModel>(builder: (context, value, child) {
        return Column(
          children: [
            value.cartList.isEmpty
                ? Expanded(
                    child: Center(
                      child: Text("Your list is empty"),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: value.cartList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.deepPurple[100],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ListTile(
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    Provider.of<FruitListModel>(context,
                                            listen: false)
                                        .deleteCard(index);
                                  },
                                ),
                                leading: Image.asset(
                                  value.cartList[index][2],
                                  height: 70,
                                  width: 70,
                                ),
                                title: Text(
                                  value.cartList[index][0],
                                  style: TextStyle(fontSize: 25),
                                ),
                                subtitle: Text('\$' + value.cartList[index][1]),
                              ),
                            ),
                          );
                        }),
                  ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepPurple),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '\$' + value.totalPrice(),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Order Info"),
                                  content: Text("Your order has been received"),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Ok")),
                                  ],
                                );
                              });
                        },
                        child: Text(
                          "Pay Now",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple[300]),
                      )
                    ]),
              ),
            ),
          ],
        );
      }),
    );
  }
}
