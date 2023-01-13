import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/Size_Config.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/widgets/custom_card.dart';
import 'package:store/services/get_all_product.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  static String id = 'homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    AllProductService().getAllProduct();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.initSize(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const BackButton(),
          centerTitle: true,
          title: const Text(
            'New Trend',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              color: Colors.black,
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.cartPlus),
            )
          ],
        ),
        body: Padding(padding:const EdgeInsets.only(top:65,left: 16,right: 16),
          child: FutureBuilder<List<ProductModel>>(
              future: AllProductService().getAllProduct(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                else if (snapshot.hasData) {
                  List<ProductModel> products = snapshot.data!;
                  return GridView.builder(
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 70),
                      itemBuilder: (context, index) {
                        return CustomCard(
                          product: products[index],
                        );
                      },
                      itemCount: products.length);
                }
                else {
                  return const Center(child: Text('no data'));
                }
              }),
        ));
  }
}

