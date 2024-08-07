import 'package:ch1_advance_flutter_exam/modal/api_modal.dart';
import 'package:ch1_advance_flutter_exam/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        title: Text("Online Shopping"),
        centerTitle: true,
        leading: Icon(Icons.search),
      ),
      body: FutureBuilder(
        future: Provider.of<HomeProvider>(context).apiComes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ApiModal>? apiModal = snapshot.data;
            homeProviderTrue.apiModalListSave = snapshot.data;
            return GridView.builder(
              itemCount: apiModal!.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child: GestureDetector(
                  onTap: () {
                    homeProviderTrue.selectIndex=index;
                    Navigator.of(context).pushNamed('/detail');
                  },
                  child: Container(
                    height: 180,
                    width: 100,
                    decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: NetworkImage(apiModal[index].image),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          color: Colors.blue.withOpacity(0),
                          child: Column(
                            children: [
                              Text(apiModal[index].title.split(" ").sublist(0,1).join(" "),style: const TextStyle(fontWeight: FontWeight.bold),),
                              Text("\$ ${apiModal[index].price}",style: const TextStyle(fontWeight: FontWeight.bold),),
                              Text("Rating ${apiModal[index].rating.rate}",style: const TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
