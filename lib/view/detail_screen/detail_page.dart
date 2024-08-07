import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProviderTrue =
        Provider.of<HomeProvider>(context, listen: true);
    HomeProvider homeProviderFalse =
        Provider.of<HomeProvider>(context, listen: false);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(homeProviderTrue
                          .apiModalListSave![homeProviderTrue.selectIndex]
                          .image)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                homeProviderTrue
                    .apiModalListSave![homeProviderTrue.selectIndex].title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "\$ ${homeProviderTrue.apiModalListSave![homeProviderTrue.selectIndex].price}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: w / 1.1,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${homeProviderTrue.apiModalListSave![homeProviderTrue.selectIndex].description}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Rating/Count : ${homeProviderTrue.apiModalListSave![homeProviderTrue.selectIndex].rating.rate}/${homeProviderTrue.apiModalListSave![homeProviderTrue.selectIndex].rating.count}",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.lightBlue)),
        onPressed: () {

          if(!homeProviderFalse.checkList(homeProviderTrue.selectIndex,homeProviderTrue.apiModalListSave![homeProviderTrue.selectIndex].price) || homeProviderTrue.addList==[])
          {
            homeProviderFalse.addToCartMethod(homeProviderTrue.selectIndex,homeProviderTrue.apiModalListSave![homeProviderTrue.selectIndex].price);
          }
          homeProviderFalse.totalCart();
          Navigator.of(context).pushNamed('/cart');
        },
        child: Text(
          "Add Cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
