import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/routes/app_pages.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Home ",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
        child:Center(
          child: Column(
            children: [
              SizedBox(height: 200,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(

                  primary: Colors.black, // background (button) color
                  onPrimary: Colors.white, // foreground (text) color
                ),
                onPressed: () {
                  Get.toNamed(Routes.newsSummary);
                } ,
                child: const Text('News Home',style: TextStyle(fontWeight: FontWeight.bold,
                fontSize:50 ),),
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // background (button) color
                  onPrimary: Colors.white, // foreground (text) color
                ),
                onPressed: (){
                  Get.toNamed(Routes.bookSummary);
                },
                child: const Text('Book Home',style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize:50 ),),
              ),
            ],
          ),
        )
      ),
    );
  }
}
