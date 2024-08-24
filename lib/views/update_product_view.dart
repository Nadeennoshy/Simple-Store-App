import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_form_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/widgets/show_snackbar.dart';

class UpdateProductView extends StatefulWidget {
  UpdateProductView({super.key});
  static String id = 'updateProduct';

  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  String? productName,description,image,price;

  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    bool isLoading = false;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            title: const Text('Update Product'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 150,),
                  CustomTextField(
                    onChanged: (data){
                      productName = data;
                    },
                    textFieldTitle: 'Product Name',
                  ),
                  const SizedBox(height: 15,),
                  CustomTextField(
                    inputType: TextInputType.number,
                    onChanged: (data){
                      price = data;
                    },
                    textFieldTitle: 'Price',
                  ),
                  const SizedBox(height: 15,),
                  CustomTextField(
                    onChanged: (data){
                      description = data;
                    },
                    textFieldTitle: 'Description',
                  ),
                  const SizedBox(height: 15,),
                  CustomTextField(
                    onChanged: (data){
                      image = data;
                    },
                    textFieldTitle: 'Image',
                  ),
                  const SizedBox(height: 30,),
                  CustomButton(
                    buttonTitle: 'Update', 
                    onTap: () async{
                     isLoading = true;
                     setState(() {
                       
                     });
                     try{
                      await updateProduct(product);
                      showSnackBar(context, 'Success');
                     }catch(e){
                      print(e.toString());
                      // showSnackBar(context, 'Failed');
                     }
                     isLoading = false;
                     setState(() {
                       
                     });
                    }
                    ),
              
                ],
              ),
            ),
          ),
        ),
    );
  }

  Future<void> updateProduct (ProductModel product) async{
    await UpdateProductService().updateProductService(
      id: product.id,
      title: productName==null?product.title:productName!, 
      price: price==null?product.price.toString():price!, 
      description: description==null?product.description:description!, 
      image: image==null?product.image:image!, 
      category: product.category);
  }
}
