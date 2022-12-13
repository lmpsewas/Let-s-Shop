import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/api_call.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopping_app/api_modal.dart';

// categories widget to show the list of products
class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // variables initialize to manipulate and contain the data
  ScrollController listScrollController = ScrollController();
  int dataLength = 0;
  bool isLoading = true;
  int itemCount = 0;
  String categoryName = "";
  AutoGenerate? productList;

  // function to get the product list from product API
  void getData() async {
    try {
      productList = await ProductList().productData();
      setState(() {
        isLoading = false;
        dataLength = productList!.fproducts.products.length;
        categoryName = productList!.fproducts.title;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // loader
  final loadingScreen = Container(
    color: Colors.black54,
    child: const SpinKitCircle(
      color: Colors.deepPurpleAccent,
      size: 60.0,
    ),
  );

  // function to make the manipulation in the name of product name
  String productPriceNameManipulation(String name){
    if(name.length < 15){
      return name;
    }
    else{
      return "${name.substring(0, 15)}...";
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Expanded(child: Text(categoryName)),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_rounded,
                    size: 30,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 3,
                  child: Container(
                    height: 22,
                    width: 22,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purpleAccent,
                    ),
                    child: Center(
                        child: Text(
                      itemCount.toString(),
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            // Your widgets here
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          if (listScrollController.hasClients) {
            final position = listScrollController.position.minScrollExtent;
            listScrollController.animateTo(
              position,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
            );
          }
        },
        isExtended: true,
        tooltip: "Scroll to Up",
        child: const Icon(
          Icons.arrow_upward,
          color: Colors.white,
        ),
      ),
      body: isLoading
          ? loadingScreen
          : GridView.count(
              childAspectRatio: 0.7,
              controller: listScrollController,
              crossAxisCount: 2,
              shrinkWrap: true,
              children: List.generate(
                dataLength,
                (index) => Product(
                  pName: productPriceNameManipulation(productList!.fproducts.products[index].name),
                  pPrice: productList!.fproducts.products[index].price,
                  pImage: productList!.fproducts.products[index].src,
                  buttonToggle: productList!.fproducts.products[index].buttonToggle,
                  onPressed: () {
                    setState(() {
                      if (productList!.fproducts.products[index].buttonToggle) {
                        productList!.fproducts.products[index].buttonToggle = false;
                        itemCount++;
                      } else {
                        productList!.fproducts.products[index].buttonToggle = true;
                        itemCount--;
                      }
                    });
                  },
                ),
              ),
            ),
    );
  }
}

// custom card widget to show the individual product
class Product extends StatelessWidget {
  const Product(
      {super.key,
      required this.pName,
      required this.pPrice,
      required this.pImage,
      required this.onPressed,
      required this.buttonToggle,});
  final String pName;
  final String pPrice;
  final String pImage;
  final void Function() onPressed;
  final bool buttonToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                flex: 8,
                child: Image.network(
                  pImage,
                  fit: BoxFit.fill,
                )),
            Expanded(
              child: Center(
                  child: Text(
                pName,
                style: const TextStyle(color: Colors.black),
              )),
            ),
            Expanded(
              child: Center(
                  child: Text(
                pPrice,
                style: const TextStyle(color: Colors.black),
              )),
            ),
            Expanded(
              flex: 2,
              child: TextButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: buttonToggle
                        ? Colors.deepPurpleAccent
                        : Colors.black45,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: buttonToggle
                        ? const Text(
                            "Add to Cart",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            "Remove from Cart",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
