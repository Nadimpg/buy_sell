
/*import 'package:buy_sellapp/Const/app_colors.dart';
import 'package:buy_sellapp/UI/widgets/image/custom_image.dart';
import 'package:buy_sellapp/services/firestore_db.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreenScreenScreen extends StatefulWidget {
  const HomeScreenScreenScreen({super.key});

  @override
  State<HomeScreenScreenScreen> createState() => _HomeScreenScreenScreenState();
}

class _HomeScreenScreenScreenState extends State<HomeScreenScreenScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
              child: FutureBuilder(
                future: FireStoreDB().getProducts(),
                builder: (_,snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasData){
                      return GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.85),
                          itemBuilder: (_,index){
                            return Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.grayColor.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0, 3))
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CachedNetworkImage(
                                      imageUrl: snapshot.data![index].thumbnail,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder: (context, url, progress) => Center(
                                      child: CircularProgressIndicator(
                                        value: progress.progress,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),

                                  Text(snapshot.data![index].title,style: TextStyle(fontSize: 16),),

                                  Text('\$${snapshot.data![index].price.toString()}',style: TextStyle(fontSize: 14),),
                                ],
                              ),
                            );
                          });
                    }else{
                      return Center(child: Text('Something went wrong'),);
                    }
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                },


              ),
            );
          }),
    );
  }
}*/


import 'package:buy_sellapp/Const/app_colors.dart';
import 'package:buy_sellapp/services/firestore_db.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: RefreshIndicator(
          onRefresh: () => FireStoreDB().getProducts(),
          child: FutureBuilder(
            future: FireStoreDB().getProducts(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.85),
                      itemBuilder: (_, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.grayColor.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(0, 3))
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CachedNetworkImage(
                                imageUrl: snapshot.data![index].thumbnail,
                                height: 100,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, progress) => Center(
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              Text(
                                snapshot.data![index].title,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                '\$ ${snapshot.data![index].price.toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                } else {
                  return Center(child: Text('something went wrong'));
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}


