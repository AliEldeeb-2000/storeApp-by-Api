import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/update_product_page.dart';


class CustomCard extends StatelessWidget {
  final ProductModel product;

  const CustomCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 40, color: Colors.grey, offset: Offset(5, 5))
      ]),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, UpdateProduct.id , arguments: product);
        },
        child: Stack(
            clipBehavior: Clip.none,
            children: [
              Card(
                elevation: 10,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        product.title.substring(0,6),
                        style: const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$''${product.price.toString()}'
                          ),
                          const Icon(Icons.favorite, color: Colors.red)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: -50,
                  right: 55,
                  child: Image.network(product.image,height: 90,width: 90,))
            ]),
      ),
    );
  }
}
