
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/widgets/custom_button.dart';
import 'package:store/screens/widgets/input_field.dart';

import '../services/update_product.dart';

class UpdateProduct extends StatefulWidget {
  static String id = 'update Product';

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? productName, description, image ;
  dynamic price;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "update Product",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 11, right: 11),
        child: Column(
          children: [
            InputField(
              hintText: 'product name',
              onChange: (data) {
                productName = data;
              },
            ),
            InputField(
              hintText: 'description',
              onChange: (data) {
                description = data;
              },
            ),
            InputField(
              inputType: TextInputType.number,
              hintText: 'price',
              onChange: (data) {
                price = data;
              },
            ),
            InputField(
              hintText: 'image',
              onChange: (data) {
                image = data;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              text: 'update',
              onTap: () async{
               try{
                await UpdateProductService().updateProduct(
                  id: product.id,
                   title: productName == null ? product.title : productName!,
                   price: price == null ? product.price.toString() : price.toString(),
                   desc: description == null ? product.description : description!,
                   image: image == null ? product.image : image!,
                   category: product.category,
                 );
               }catch (e){
                 if (kDebugMode) {
                   print(e);
                 }
               }

              },
            ),
          ],
        ),
      ),
    );
  }
}
