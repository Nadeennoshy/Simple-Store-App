import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService{
  Future<ProductModel> updateProductService(
    {required String title,
    required String price,
    required String description,
    required String image,
    required String category,
    required int id,
    }
  ) async{
    print('id: $id');
    Map<String,dynamic> product = await Api().putRequest(
      url: 'https://fakestoreapi.com/products/$id', 
      body: {
        'title':title,
        'price': price,
        'description': description,
        'image': image,
        'category':category,
      },);
      return ProductModel.fromJson(product);
  }
}