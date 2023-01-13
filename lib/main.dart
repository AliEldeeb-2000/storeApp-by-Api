import 'package:flutter/material.dart';
import 'package:store/screens/home_page.dart';
import 'package:store/screens/update_product_page.dart';

import 'Size_Config.dart';
import 'constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        HomePage.id : (context) => const HomePage(),
        UpdateProduct.id : (context)=>UpdateProduct()
      },
      initialRoute: HomePage.id,
    );
  }
}
