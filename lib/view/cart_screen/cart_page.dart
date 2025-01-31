import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProviderTrue =
    Provider.of<HomeProvider>(context, listen: true);
    HomeProvider homeProviderFalse =
    Provider.of<HomeProvider>(context, listen: false);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
        centerTitle: true,
      ),
      body: ListView.builder(itemCount: homeProviderTrue.addList.length,itemBuilder: (context, index) =>
      Container(
        height: 150,
        child: Card(
          color: Colors.blue.shade100,
          child: Column(
            children: [
              Row(
                children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     height: 120,
                     width: 100,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: NetworkImage(homeProviderTrue.apiModalListSave![int.parse(homeProviderTrue.addList[index].split(" ").sublist(0,1).join(" "))].image)
                       ),
                     ),
                   ),
                 ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Text(
                        homeProviderTrue
                            .apiModalListSave![int.parse(homeProviderTrue.addList[index].split(" ").sublist(0,1).join(" "))].title.split(" ").sublist(0,1).join(" "),
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$ ${homeProviderTrue
                            .apiModalListSave![int.parse(homeProviderTrue.addList[index].split(" ").sublist(0,1).join(" "))].price}",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                      Spacer(),
                      Row(
                        children: [
                          IconButton(onPressed: () {
                            homeProviderFalse.removeCartItem(index);
                          }, icon: const Icon(Icons.delete)),
                        ],
                      ),
                  SizedBox(width: 10,),
                ],
              ),
            ],
          ),
        ),
      ),),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.blue.shade400,
        width: double.infinity,
        child: Center(child: Text("\$ "+homeProviderTrue.total.toString(),style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
      ),
    );
  }
}