import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetCategoryService{
  Future<List<ProductModel>>getCategory({required String categoryName})async{
    List<dynamic> categoryProducts = await Api().getRequest(url: 'https://fakestoreapi.com/products/category/$categoryName');
     List<ProductModel> productsInCategory = [];
     for(int i=0;i<categoryProducts.length;i++){
      productsInCategory.add(ProductModel.fromJson(categoryProducts[i]));
     }
     return productsInCategory;
  }
}
