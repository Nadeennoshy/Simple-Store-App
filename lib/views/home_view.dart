import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'homeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.w,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            'New Trend',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.cartShopping)),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
            child: FutureBuilder<List<ProductModel>>(
                future: AllProductsService().getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ProductModel> products = snapshot.data!;
                    return GridView.builder(
                        itemCount: products.length,
                        clipBehavior: Clip.none,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 60,
                        ),
                        itemBuilder: (context, index) {
                          return CustomCard(
                            product: products[index],
                          );
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
