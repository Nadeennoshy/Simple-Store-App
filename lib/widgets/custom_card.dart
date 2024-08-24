import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/views/update_product_view.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductView.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            // height: 120,
            // width: 195,
            decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0,
                offset: const Offset(10, 10),
              )
            ]
            ),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(product.title.substring(0,11),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),),
                    const SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$''${product.price}',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),),
                        const Icon(Icons.favorite,
                        color: Colors.red,),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 5,
            top: -55,
            child: Image.network(product.image,
            height: 100,
            width: 100,),
          ),
        ],
      ),
    );
  }
}